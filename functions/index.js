const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

  exports.updateUserFeedAfterFollow = functions.firestore.document('/following/{currentUid}/user-following/{uid}').onCreate((snap, context) => {
    const currentUid = context.params.currentUid;
    const uid = context.params.uid;
    const db = admin.firestore();

    return db.collection('tweets').where('uid', '==', uid).get().then((snapshot) => {
        snapshot.forEach((doc) => { 
            const tweetId = doc.id;
            const writeResult = db.collection('users').doc(currentUid).collection('user-feed').doc(tweetId);
            writeResult.set({});
        });
        return null;
      })
      .catch((err) => {
        functions.logger.log(err);
      });
  });

  exports.updateUserFeedAfterUnfollow = functions.firestore.document('/following/{currentUid}/user-following/{uid}').onDelete((snap, context) => {
    const currentUid = context.params.currentUid;
    const uid = context.params.uid;
    const db = admin.firestore();

    return db.collection('tweets').where('uid', '==', uid).get().then((snapshot) => {
        snapshot.forEach((doc) => { 
            const tweetId = doc.id;
            db.collection('users').doc(currentUid).collection('user-feed').doc(tweetId).delete();
        });
        return null;
      })
      .catch((err) => {
        functions.logger.log(err);
      });
  });

  exports.updateUserFeedAfterPost = functions.firestore.document('/tweets/{tweetId}').onCreate((snap, context) => {
    const tweetId = context.params.tweetId;
    const data = snap.data();
    const ownerUid = data.uid
    const db = admin.firestore();

    return db.collection('followers').doc(ownerUid).collection('user-followers').get().then((snapshot) => {
        snapshot.forEach((doc) => {
            db.collection('users').doc(doc.id).collection('user-feed').doc(tweetId).set({});
        });

        db.collection('users').doc(ownerUid).collection('user-feed').doc(tweetId).set({});

        return null;
    });
  });


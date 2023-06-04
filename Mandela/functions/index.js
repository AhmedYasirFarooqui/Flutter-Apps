import { config, firestore } from "firebase-functions";

admin.initializeApp(config().firebase);

const fcm = admin.messaging();

export const senddevices = firestore
  .document("notification/{id}")
  .onCreate((snapshot) => {
    const title = snapshot.get("title");
    const description = snapshot.get("description");
    const token = snapshot.get("token");

    const payload = {
      notification: {
        title: "title " + title,
        body: "description " + description,
        sound: "default",
      },
    };

    return fcm.sendToDevice(token, payload);
  }); 

import consumer from "channels/consumer"

// import consumer from "./consumer";

document.addEventListener("turbolinks:load", () => {
  const postElement = document.getElementById("post-id");
  const postId = postElement.getAttribute("data-post-id");
  

  if (postId) {
    console.log("POst id", postId)
    consumer.subscriptions.create(
      { channel: "CommentsChannel", post_id: postId },
      
      {
        received(data) {
          console.log("Commment data", data)
          // Insert the new comment at the end of the comments list
          document.getElementById("comments").insertAdjacentHTML("beforeend", data.comment);
        }
      }
    );
  }
});

const toast = document.getElementById("toasts-messaje");

const messages = [
  "Notificación Informativa",
  "Notificación Error",
  "Notificación Exitosa",
  "Notificación Advertencia"
];

const types = ["info", "success", "error", "warning"];

export function createToast(message = null, type = null) {
	console.log('Motrando Toast');
  let properties;

  const notif = document.createElement("div");
  const notifIcon = document.createElement("span");
  const notificationType = type ? type : getRandomType();

  properties = setProperties(notificationType);

  notif.classList.add("toast-content");
  notif.classList.add(notificationType);

  notifIcon.classList.add(properties[0]);
  notifIcon.classList.add(properties[1]);

  notif.innerText = messages[properties[2]];

  toast.appendChild(notif);
  notif.append(notifIcon);

  setTimeout(() => {
    notif.remove();
  }, 2000);
}

function setProperties(notificationType) {
  let propertyList;

  switch (notificationType) {
    case "info":
      propertyList = ["bx", "bx-info-circle", 0];
      break;
    case "error":
      propertyList = ["bx", "bxs-error-circle", 1];
      break;
    case "success":
      propertyList = ["bx", "bxs-check-circle", 2];
      break;
    case "warning":
      propertyList = ["bx", "bxs-error", 3];
      break;
  }

  return propertyList;
}

function getRandomType() {
  return types[Math.floor(Math.random() * types.length)];
}

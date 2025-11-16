// exports.handler = async (event) => {
//   const path = event.rawPath || event.path || "/";

//   if (path !== "/") {
//     return {
//       statusCode: 404,
//       headers: { "Content-Type": "application/json" },
//       body: JSON.stringify({ error: "Resource not found" })
//     };
//   }

//   return {
//     statusCode: 200,
//     headers: { "Content-Type": "application/json" },
//     body: JSON.stringify({ message: "Hello from JSON!" })
//   };
// };
exports.handler = (event, context, callback) => {
  callback(null, {statusCode: 200, body: "DevOps Labs!"});
};

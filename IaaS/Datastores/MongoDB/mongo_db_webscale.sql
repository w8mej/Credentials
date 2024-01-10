db.runCommand({
  createUser: "thesorrow",
  pwd: "thisisinsecuresoCHANGEM3!",
  customData: { name: "John Menerick", operator: "human" },
  roles: [],
  writeConcern: { w: "majority", wtimeout: 30000.0 },
  authenticationRestrictions: [ {
    clientSource: ["127.0.0.1", "::1"],
    serverAddress: ["127.0.0.1", "::1"]
  } ]
});

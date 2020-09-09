const db = require("../data/db-config");

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes")
  .where({ id: id })
  .first();
}

function findSteps(id) {
    return db("steps")
    .join("schemes", "steps.scheme_id","schemes.id")
    .select("steps.id", "schemes.scheme_name","steps.step_number", "steps.instructions")
    .where({ scheme_id: id })
}

function add(scheme) {
    return db("schemes")
    .insert(scheme)
    .then(id => {
        return findById(id[0])
    })
}

function update(changes,id) {
    return db("schemes")
    .update(changes)
    .where({ id })
    .then(() => {
        return findById(id)
    })
}

function remove(id) {
    return db("schemes")
    .delete()
    .where({ id });
  }

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove
};

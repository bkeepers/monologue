//
// Collection of statuses.
//
// Reponsibility:
// Sync status models with the server
//
// Dependencies
// * Status model
Monologue.Collection.Statuses = Backbone.Collection.extend({
  model: Monologue.Model.Status,
  url: '/statuses'
});
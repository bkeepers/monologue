describe("Monologue.View.StatusList", function() {
  var view, $el, collection;

  beforeEach(function() {
    $el = $('<div/>');
    collection = new (Backbone.Collection.extend({url: '/mock'}));
    // prevent collection from trying to refresh from the server
    spyOn(collection, 'fetch');

    view = new Monologue.View.StatusList({el: $el, collection: collection});
  });

  it("fetches records from the server", function() {
    expect(collection.fetch).toHaveBeenCalled();
  });

  it("renders when collection is reset", function() {
    collection.reset([{text: 'Unit testing is fun'}]);
    expect($el.find('li').length).toBe(1);
    expect($el.find('li').text()).toEqual('Unit testing is fun');
  });

  it("appends newly added items", function() {
    collection.add({text: 'Maybe not "fun", but at least useful'});
    expect($el.find('li').length).toBe(1);
    expect($el.find('li').text()).toEqual('Maybe not "fun", but at least useful');
  });
});
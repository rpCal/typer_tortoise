App.IndexRoute = App.SnippetPlayRoute.extend({
  model: function (params) {
    // TODO: This is done more for the side-effect than to return a 'model'.
    return App.get('typingAreaController').newSnippet();
  },
});
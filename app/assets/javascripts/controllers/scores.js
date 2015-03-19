App.ScoresController = Em.ArrayController.extend({
  init: function () {
    this._super();
    this.loadScores();
  },

  loadScores: function (score) {
    $.get('/scores/', (function (json) {
      this.set('model', json);
    }).bind(this));
  },

  add: function (score) {
    this.pushObject(score);
  }
});
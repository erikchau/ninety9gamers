FinalProject.Routers.AppRouter = Backbone.Router.extend({
  
  routes:{
    '': 'dashboard',
    'games': 'browse',
    'games/:id': 'gameShow',
    'user/:id': 'userShow',
    'sell': 'sellGames',
    'purchased': 'purchased'
  },
  
  dashboard: function(){
    var games = new FinalProject.Collections.Games
    games.fetch({data: {dashboard: true}})
    var dashboardView = new FinalProject.Views.Dashboard({collection: games});
    this.swapView(dashboardView);
  },
  
  sellGames: function(){
    var sellView = new FinalProject.Views.Sell;
    this.swapView(sellView);
  },
  
  browse: function(){
    FinalProject.Collections.games.fetch();
    var browseView = new FinalProject.Views.Browse({collection: FinalProject.Collections.games})
    this.swapView(browseView);
  },
  
  gameShow: function(id){
    var game = FinalProject.Collections.games.getOrFetch(id);
    var showView = new FinalProject.Views.GameShow({model: game})
    this.swapView(showView);
  },
  
  purchased: function(){
    var purchaseView = new FinalProject.Views.Purchased;
    this.swapView(purchaseView);
  },
  
  userShow: function(id){
    var user = FinalProject.Collections.users.getOrFetch(id)
    var games = new FinalProject.Collections.Games
    games.fetch({data: {user_id: id}})
    var userView = new FinalProject.Views.UserShow({model: user, collection: games})
    this.swapView(userView)
  },
  
  swapView: function(view){
    if(this.currentView){
      this.currentView.remove()
    }
    
    $('.content').html(view.render().$el)
    this.currentView = view
  }
  
  
  
})
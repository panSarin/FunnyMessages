App.users = App.cable.subscriptions.create('UsersChannel', {
    received: function(data) {
        console.debug(data);
        return $('#users ul').append(this.renderUser(data));
    },

    renderUser: function(data) {
        return "<li>" + data.name + "</li>";
    }
});

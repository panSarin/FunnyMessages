App.users = App.cable.subscriptions.create('UsersChannel', {
    received: function(data) {
        if(data.deleted == true) {
            return $("#users > ul > li:contains('"+data.name+"')").remove();
        }else {
            return $('#users ul').append(this.renderUser(data));
        };
    },

    renderUser: function(data) {
        return "<li>" + data.name + "</li>";
    }
});

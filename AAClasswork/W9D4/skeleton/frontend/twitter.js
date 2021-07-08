const FollowToggle = require('./follow_toggle');


$(function() {
    $(".follow-toggle").each( (idx, btn) => new FollowToggle(btn));
});

// $(function(){
//     new ChatMachine($('.chat'));
//   });
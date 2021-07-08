const TwitterAPI = require('./twitter_api');
class FollowToggle {
    constructor(el) {

        this.$button = $(el);
        
        this.followState = this.$button.data('initial-follow-state');
        this.userId = this.$button.data('user-id');

        this.render();
        this.$button.on('click', this.handleClick.bind(this));
    }

    render() {
        // if(this.followState === 'Followed') {
        //     this.$button.html('Unfollow!');
        // } else {
        //     this.$button.html('Follow!');
        // }
        // switch (this.followState) {
        //     case 'followed':
        //       this.$button.prop('disabled', false);
        //       this.$button.html('Unfollow!');
        //       break;
        //     case 'unfollowed':
        //       this.$button.prop('disabled', false);
        //       this.$button.html('Follow!');
        //       break;
        //     case 'following':
        //       this.$button.prop('disabled', true);
        //       this.$button.html('Following...');
        //       break;
        //     case 'unfollowing':
        //       this.$button.prop('disabled', true);
        //       this.$button.html('Unfollowing...');
        //       break;
        //   }
    }

    // if (this.followState === 'followed') {
    //     this.followState = 'unfollowing';
    //     this.render();
    //     APIUtil.unfollowUser(this.userId).then(() => {
    //       followToggle.followState = 'unfollowed';
    //       followToggle.render();
    //     });
    //   } else if (this.followState === 'unfollowed') {
    //     this.followState = 'following';
    //     this.render();
    //     APIUtil.followUser(this.userId).then(() => {
    //       followToggle.followState = 'followed';
    //       followToggle.render();
    //     });
    //   }
    handleClick(e) {
        const that = this;
        e.preventDefault();
        if(this.followState === 'Followed') {
            this.followState = 'Unfollowing';
            this.render();
            TwitterAPI.unfollow(this.userId)
            .then( () => {
                that.followState = 'Unfollowed';
                that.render();
            });

        } else {
            this.followState = 'Following'
            this.render();
            TwitterAPI.follow(this.userId)
            .then( () => {
                that.followState = 'Followed'
                that.render();
            })
        }
    }
}


module.exports = FollowToggle;
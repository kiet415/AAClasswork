const TwitterAPI = {
    follow: (id) => {
        return $.ajax({
            method: 'POST',
            url: `/users/${id}/follow`
        })
    },

    unfollow: (id) => {
        return $.ajax({
            method: 'DELETE',
            url: `/users/${id}/follow`
        })
    }

}
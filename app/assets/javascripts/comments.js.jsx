/** @jsx React.DOM */

var RequireLogin = React.createClass({
  render: function() {
    return (
      <div>
        <p>Para postar comentários é necessário efetuar Login no site</p>
      </div>
    );
  }
});

var Comment = React.createClass({
  render: function() {
    var commentId = 'new-comment-' + this.props.key;

    return (
      <li>
        <article id={commentId} className="comment new-comment">
          <img src={this.props.user.image} className="comment-avatar" />
          <div className="comment-content">
            <h4 className="comment-user">
              {this.props.user.name}
            </h4>
            <div className="comment-body">
              {this.props.children}
            </div>
          </div>
        </article>
      </li>
    );
  }
});

var CommentList = React.createClass({
  render: function() {
    var commentNodes = this.props.data.map(function (comment, index) {
      return <Comment key={index} user={comment.user}>{comment.body}</Comment>;
    });
    return <ul className="comment-list">{commentNodes}</ul>;
  }
});

var CommentForm = React.createClass({
  submitToServer: function(comment) {
    $.ajax({
      url: '/posts/' + this.props.post + '/comentarios',
      type: 'POST',
      dataType: 'json',
      data: comment,
      success: function(data) {
        console.log(data);
      }.bind(this)
    });
  }, 
  handleSubmit: function(e) {
    e.preventDefault();
    var name = this.props.user.name
      , uid = this.props.user.uid
      , picture = this.props.user.image
      , text = this.refs.text.getDOMNode().value.trim();

    if (text != '') {
      var comment = {
        user: {
          uid: uid, 
          name: name, 
          image: picture
        }, 
        body: text
      }
      this.submitToServer(comment);
      this.props.onCommentSubmit(comment);
    }
    this.refs.text.getDOMNode().value = '';
    return false;
  },
  render: function() {
    return (
      <form className="comment-form" onSubmit={this.handleSubmit}>
        <h4>
          <img src={this.props.user.image} className="image-user" />
          <span className="user-name">{this.props.user.name}</span>
        </h4>
        <textarea className="comment-input" ref="text"></textarea>
        <input type="submit" value="Comentar" className="send-btn" />
      </form>
    );
  }
});

var CommentBox = React.createClass({
  getInitialState: function() {
    return {
      user: userData, 
      data: []
    };
  },
  loadCommentsFromServer: function() {
    var url = '/posts/' + this.props.post + '/comentarios';
    $.ajax({
      url: url,
      dataType: 'json',
      success: function(data) {
        data.map(function (comment, index) {
          comment.user_id = comment.identity_id;
          return comment;
        });
        this.setState({data: data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(url, status, err.toString());
      }.bind(this)
    });
  },
  componentDidMount: function() {
    this.loadCommentsFromServer();
    setInterval(this.loadCommentsFromServer, 5000);
  },
  handleCommentSubmit: function(comment) {
    new_comments = this.state.data.concat([comment]);
    this.setState({data: new_comments});
  },
  render: function() {
    return (
      <div className="comment-wrapper">
        <CommentList data={this.state.data} />
        <CommentForm user={this.state.user} post={this.props.post} onCommentSubmit={this.handleCommentSubmit} />
      </div>
    );
  }
});

if (userData.login) {
  React.renderComponent(<CommentBox post={postData.id} />, document.getElementById('comment_block'));
} else {
  React.renderComponent(<RequireLogin />, document.getElementById('comment_block'));
}

/** @jsx React.DOM */

var LinkLogin = React.createClass({
  render: function() {
    return (
      <form className="comment-form">
        <a href="#signin-modal" data-toggle="modal">
          <img src="http://st.navj.us/assets/default-avatar-m.jpg" />
          <div className="form-group">
            <textarea placeholder="Coloque aqui seu comentário" className="form-control comment-input" ref="text"></textarea>
          </div>
        </a>
      </form>
    );
  }
});

var Comment = React.createClass({
  render: function() {
    var commentId = 'new-comment-' + this.props.key
      , postTime = dateFormat(this.props.date, "dd/mm/yyyy HH:MM");

    return (
      <li>
        <article id={commentId} className="comment new-comment">
          <header>
            <a href={this.props.author.url} className="comment-avatar">
              <img src={this.props.author.image} />
            </a>
            <h4 className="comment-author">
              <a href={this.props.author.url} className="author-name">{this.props.author.name}</a>
            </h4>
            <p className="comment-date">
              <a href={'#' + commentId}>{postTime}</a>
            </p>
          </header>
          <div className="comment-body">
            {this.props.children}
          </div>
        </article>
      </li>
    );
  }
});

var CommentList = React.createClass({
  render: function() {
    var commentNodes = this.props.data.map(function (comment, index) {
      return <Comment key={comment.key} author={comment.author} date={comment.date}>{comment.text}</Comment>;
    });
    return <ul className="comment-list">{commentNodes}</ul>;
  }
});

var CommentForm = React.createClass({
  submitToServer: function(comment) {
    $.ajax({
      url: '/comentarios/' + this.props.article,
      type: 'POST',
      dataType: 'json',
      data: comment,
      success: function(data) {
        var comment_element = $('#new-comment-' + comment.key);
        var cc = $('#comment_count');
        comment_element.removeClass('new-comment');

        if (data.error == true) {
          comment_element.find('header').remove();
          comment_element.find('.comment-body').text('Erro ao tentar enviar esse comentário. Favor tentar novamente.').addClass('error');
        } else {
          cci = parseInt(cc.text());
          if (!isNaN(cci)) cc.text(cci + 1);
          comment_element.find('.comment-avatar').attr('href', data.author.profile);
          comment_element.find('.comment-avatar img').attr('src', data.author.image);
          comment_element.find('.author-name').text(data.comment.name).attr('href', data.author.profile);
          comment_element.find('.comment-date a').text(data.comment.date).attr('href', '#comment-' + data.comment.id);
          comment_element.find('.comment-body').html(data.comment.body);
          comment_element.attr('id', 'comment-' + data.comment.id);
        }
      }.bind(this)
    });
  }, 
  randomKey: function() {
    var r = [Math.random(), Math.random(), Math.random(), Math.random()];
    var s = r.map(function (n) {
      return n.toString(36).slice(2, 7);
    })
    return s.join('-');
  }, 
  handleSubmit: function() {
    var name = this.props.author.name;
    var uid = this.props.author.uid;
    var picture = this.props.author.image;
    var profile = this.props.author.profile_url;
    var text = this.refs.text.getDOMNode().value.trim();

    if (text != '') {
      var comment = {
        key: this.randomKey(),
        author: {
          uid: uid, 
          name: name, 
          url: profile, 
          image: picture
        }, 
        text: text, 
        date: new Date()
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
        <img src={this.props.author.image} />
        <div className="form-group">
          <textarea placeholder="Coloque aqui seu comentário" className="comment-input form-control" ref="text"></textarea>
        </div>
        <h4><small>comentar como</small> {this.props.author.name}</h4>
        <input type="submit" value="Comentar" className="btn btn-primary" />
      </form>
    );
  }
});

var CommentBox = React.createClass({
  getInitialState: function() {
    return {
      author: userData, 
      article: articleData.aid, 
      data: []
    };
  },
  handleCommentSubmit: function(comment) {
    new_comments = [comment].concat(this.state.data);
    this.setState({data: new_comments});
  },
  render: function() {
    return (
      <div className="comment-wrapper">
        <CommentForm author={this.state.author} article={this.state.article} onCommentSubmit={this.handleCommentSubmit} />
        <CommentList data={this.state.data} />
      </div>
    );
  }
});

if (userData.login) {
  React.renderComponent(<CommentBox />, document.getElementById('comment-action'));
} else {
  React.renderComponent(<LinkLogin />, document.getElementById('comment-action'));
}

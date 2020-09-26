import React from 'react';
import ChannelList from '../containers/channel_list';
import MessageList from '../containers/message_list';

const App = (props) => {
  return (
    <div className="messaging-wrapper">
      <div className="logo-container">
        <img className="messaging-logo" src="https://images.unsplash.com/photo-1511632765486-a01980e01a18?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60" alt="logo" />
      </div>
      <ChannelList selectedChannel={props.match.params.channel}/>
      <MessageList selectedChannel={props.match.params.channel}/>
    </div>
  );
};

export default App;

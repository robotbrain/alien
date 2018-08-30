#!/usr/bin/env zsh


alien_storage_info(){
  fs=`df -h . | tail -1 | awk '{print $1}' | sed "s|\.|•|g" `;
  size=`df -h . | tail -1 | awk '{print $2}' | sed "s|\.|•|g" `;
  used=`df -h . | tail -1 | awk '{print $3}' | sed "s|\.|•|g" `;
  usedp=`df -h . | tail -1 | awk '{print $5}' | sed "s|\.|•|g" `;
  free=`df -h . | tail -1 | awk '{print $4}' | sed "s|\.|•|g" `;
  echo -n "💾 $fs - F:$free U:$used T:$size";
}

alien_date_time_info(){
  [[ -z $ALIEN_DATE_TIME_FORMAT ]] && echo -n "`date +%r`" || echo -n "`date +${ALIEN_DATE_TIME_FORMAT}`";
}

alien_ssh_client(){
  if [ -n "${SSH_CLIENT}" ]; then
    echo -n $SSH_CLIENT | awk {'print $1 " "'};
  fi
}

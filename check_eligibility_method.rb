require_relative 'seed'

def eligible?(user_id)

  # create week_ago_frm, a formatted string of the time exactly seven days
  # before #eligible? is called, which can then be fed to the sql query
  week_ago = DateTime.now
  7.times { week_ago = week_ago.prev_day }
  week_ago_str = week_ago.to_s # => '2019-06-01T16:25:35-04:00'
  # format string for sql
  week_ago_frm = week_ago_str[0..9] + " " + week_ago_str[11..18] # => '2019-06-01 16:25:35'

  #########################################################

          ######## HERE'S THE SQL QUERY ########

  #########################################################
  raw = DB.execute "SELECT contents FROM messages WHERE time_sent >= ? AND sender_id = ?", week_ago_frm, user_id

  # test in sqlite3 console:
  # SELECT contents FROM messages WHERE time_sent >= '2019-06-01 16:25:35' AND sender_id = 1;

  # print output of sql statement
  # if raw.size != 0
  #   puts 'raw output: ', raw
  # else
  #   puts 'no output'
  # end

  # check number of messages
  if raw.size == 5
    puts "citizen #{user_id} ineligible -- too many messages (#{raw.size})"
    return false
  end

  # mash all message contents returned from query into one string
  characters = raw.join('')

  # check character count of string of all message contents
  if characters.size >= 200
    puts "citizen #{user_id} ineligible -- too many characters (#{characters.size})"
    return false
  end

  # citizen is eligible
  puts "citizen #{user_id} eligible -- #{characters.size} characters in #{raw.size} messages"
  return true
end

#########
# TESTS #
#########

# check if citizen 1 is eligible (yes)
eligible?(1)

# check if citizen 2 is eligible (no -- too many messages (5))
eligible?(2)

# check if citizen 3 is eligible (no -- too many characters (200))
eligible?(3)

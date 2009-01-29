def path_to(page_name)
  case page_name
  
  when /the homepage/i
    root_path
  
  # Add more page name => path mappings here
  
  # added by script/generate pickle path
  
  when /^#{capture_model}(?:'s)? page$/                         # eg. the forum's page
    pickle_path $1
    
  when /^#{capture_model}(?:'s)? #{capture_model}(?:'s)? page$/ # eg. the forum's post's page
    pickle_path $1, $2

  when /^#{capture_model}(?:'s)? #{capture_model}'s (.+?) page$/# eg. the forum's post's comments page
    pickle_path $1, $2, :extra => $3                            #  or the forum's post's edit page

  when /^#{capture_model}(?:'s)? (.+?) page$/                   # eg. the forum's posts page
    pickle_path $1, :extra => $2                                #  or the forum's edit page

  when /^the (.+?) page$/                                       # translate to named route
    send "#{$1.downcase.gsub(' ','_')}_path"
  
  # end added by pickle path

  else
    raise "Can't find mapping from \"#{page_name}\" to a path."
  end
end
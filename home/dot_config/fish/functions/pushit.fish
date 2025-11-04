function pushit --wraps=git\ commit\ -am\ \'pushit\'\;\ git\ push --description alias\ pushit\ git\ commit\ -am\ \'pushit\'\;\ git\ push
  git commit -am 'pushit'; git push $argv; 
end

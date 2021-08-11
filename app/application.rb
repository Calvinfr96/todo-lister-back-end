class Application

  def call(env)
    res = Rack::Response.new
    req = Rack::Request.new(env)

    #USER ROUTES

    #Index
    if req.path == '/users' && req.get?
      return [200, {'Content-Type' => 'application/json'}, [User.all.to_json]]
    end

    #Create
    if req.path == '/users' && req.post?
      body = JSON.parse(req.body.read)
      new_user = User.create(body)
      return [201, {'Content-Type' => 'application/json'}, [new_user.to_json]]
    end

    #Show
    if req.path.match('/users/') && req.get?
      id = req.path.split('/')[2]
      user = User.find_by_id(id)

      if user
        return [200, {'Content-Type' => 'application/json'}, [user.as_json(include: :tasks).to_json]]
      else
        return [404, {'Content-Type' => 'application/json'}, [ {"message" => "Error 404: Content not found"}.to_json ]]
      end
    end

    #Update
    if req.path.match('/users/') && req.patch?
      id = req.path.split('/')[2]
      body = JSON.parse(req.body.read)
      user = User.find_by_id(id)

      if user
        user.update(body)
        return [202, {'Content-Type' => 'application/json'}, [user.to_json]]
      else
        return [404, {'Content-Type' => 'application/json'}, [ {"message" => "Error 404: Content not found. Could not update record"}.to_json ]]
      end
    end

    #Delete
    if req.path.match('/users/') && req.delete?
      id = req.path.split('/')[2]
      user = User.find_by_id(id)

      if user
        user.destroy
        return [200, {'Content-Type' => 'application/json'}, [{"message" => "User destroyed."}.to_json]]
      end
    end

    if req.path.match(/test/) 
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]

    else
      res.write "Path Not Found"

    end

    res.finish
  end
  
end
  
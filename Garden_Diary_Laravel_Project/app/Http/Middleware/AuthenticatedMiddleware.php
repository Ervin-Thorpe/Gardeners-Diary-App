<?php

namespace App\Http\Middleware;

use Closure;
use Auth;

class AuthenticatedMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if(Auth::Check())
            return $next($request);
        
        return redirect("/login");
    }
}

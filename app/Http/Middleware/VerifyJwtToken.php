<?php namespace App\Http\Middleware;

use Closure;
use JWTAuth;
use Illuminate\Http\Response as HttpResponse;

class VerifyJwtToken {

	/**
	 * Handle an incoming request.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  \Closure  $next
	 * @return mixed
	 */
	public function handle($request, Closure $next)
	{
		$token = $request->input('token');

		try {
			$user = JWTAuth::toUser($token);
			$request->merge(array('user' => $user));
			return $next($request);
		} catch(\Tymon\JWTAuth\Exceptions\JWTException $e) {
			return Response()->json(array('status'=>false, 'message' => 'Your token was expired.'));
		}
	}

}

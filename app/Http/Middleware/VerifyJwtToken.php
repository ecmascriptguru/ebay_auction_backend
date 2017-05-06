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
			return $next($request);
		} catch(\Tymon\JWTAuth\Exceptions\JWTException $e) {
			return Response()->json(array('status'=>false), HttpResponse::HTTP_UNAUTHORIZED);
		}
	}

}

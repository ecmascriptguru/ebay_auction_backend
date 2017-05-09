<?php namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use App\Item;
use App\History;
use App\Domain;

class HomeController extends Controller {

	/*
	|--------------------------------------------------------------------------
	| Home Controller
	|--------------------------------------------------------------------------
	|
	| This controller renders your application's "dashboard" for users that
	| are authenticated. Of course, you are free to change or remove the
	| controller as you wish. It is just here to get your app started!
	|
	*/

	/**
	 * Create a new controller instance.
	 *
	 * @return void
	 */
	public function __construct()
	{
		$this->middleware('auth');
	}

	/**
	 * Show the application dashboard to the user.
	 *
	 * @return Response
	 */
	public function index()
	{
		// $dom = new DOMDocument(); 
		// $tmp = file_get_contents("http://vi.vipr.ebaydesc.com/ws/eBayISAPI.dll?ViewItemDescV4&item=292083189107&t=1493453120000&tid=310&category=177831&seller=w.giddy&excSoj=1&excTrk=1&lsite=3&ittenable=false&domain=ebay.co.uk&descgauge=1");
		// $dom->loadHTML($tmp);
		// exit;
		return view('home');
	}

}

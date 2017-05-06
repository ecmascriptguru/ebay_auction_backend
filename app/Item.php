<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class Item extends Model {

	//
	public function founder()
    {
        return $this->belongsTo('App\User', 'found_by');
    }

	public function histories() {
		return $this->hasMany('App\History');
	}
}

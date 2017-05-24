<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class Property extends Model {

	protected $fillable = ['ref'];
	//
	public function founder()
    {
        return $this->belongsTo('App\User', 'created_by');
    }

	public function histories() {
		return $this->hasMany('App\PropertyHistory', 'property_id');
	}

}

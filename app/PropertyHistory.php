<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class PropertyHistory extends Model {

	protected $fillable = ['price', 'currency', 'title', 'address/subtitle', 'features', 'description', 'status'];
	//
	public function founder()
    {
        return $this->belongsTo('App\User', 'created_by');
    }

	public function agent()
    {
        return $this->belongsTo('App\Agent', 'agent_id');
    }

}

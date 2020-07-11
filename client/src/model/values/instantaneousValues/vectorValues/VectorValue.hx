package model.values.instantaneousValues.vectorValues;
import model.values.instantaneousValues.vectorValues.VectorValueI;
import model.values.instantaneousValues.InstantaneousValueI;
import model.values.instantaneousValues.scalarValues.ScalarValueI;

/**
 * Vectorised values.
 * Traversed as per the documentation for vectors. Array Indexing : Reverse : [2,1,0]. 2 denotes the end and 0 the beginning.
 * @author AdvaitTrivedi
 */
class VectorValue implements VectorValueI 
{
	var vector : Array<InstantaneousValueI> = new Array<InstantaneousValueI>();

	public function new() 
	{
		
	}
	
	
	/* INTERFACE model.values.VectorValueI */
	
	@:allow(model.values.SignalValueI)
	@:allow(model.values.instantaneousValues.scalarValues.ScalarValueI)
	function fromArray(instanteousValues: Array<InstantaneousValueI>) : VectorValueI {
		for (value in instanteousValues) {
			this.insert(value);
		}
		
		return this;
	}
	
	@:allow(model.values.SignalValueI)
	@:allow(model.values.instantaneousValues.scalarValues.ScalarValueI)
	function insert(instantaneousValue:InstantaneousValueI, ?index:Int = 0):Void 
	{
		if (index > this.length() - 1 || index < 0) { throw "Invalid index"; }
		
		this.vector.insert(index, instantaneousValue);
	}
	
	@:allow(model.values.SignalValueI)
	@:allow(model.values.instantaneousValues.scalarValues.ScalarValueI)
	function removeFrom(?index:Int = 0):InstantaneousValueI 
	{
		if (index == 0) {
			return this.vector.shift();
		}
		
		if (index > this.length() - 1 || index < 0) {
			throw "Invalid index";
		}
		
		var valuePopped = this.vector[index];
		this.vector.remove(valuePopped);
		return valuePopped;
	}
	
	public function length():Int 
	{
		return this.vector.length;
	}
	
	public function iterator():Iterator<InstantaneousValueI> 
	{
		return this.vector.iterator();
	}
	
	public function toString() : String {
		var string = "[";
		for (value in this.vector) {
			string += value.toString() + ((this.vector.indexOf(value) == this.length()-1) ? "" : ",");
		}
		string += "]";
		return string;
	}
	
	@:allow(model.gates.AND)
	@:allow(model.values.instantaneousValues.InstantaneousValueI)
	function and(instantaneousValue: InstantaneousValueI) : InstantaneousValueI {
		if (Std.is(instantaneousValue, ScalarValueI)) {
			return instantaneousValue.and(this);
		} else {
			// Vector-Vector AND case
			// TODO : Understand this better
			return this;
		}
	}
	
	@:allow(model.gates.OR)
	@:allow(model.values.instantaneousValues.InstantaneousValueI)
	function or(instantaneousValue: InstantaneousValueI) : InstantaneousValueI {
		if (Std.is(instantaneousValue, ScalarValueI)) {
			return instantaneousValue.or(this);
		} else {
			// Vector-Vector AND case
			// TODO : Understand this better
			return this;
		}
	}
	
	@:allow(model.gates.NOT)
	@:allow(model.values.instantaneousValues.InstantaneousValueI)
	function not() : InstantaneousValueI {
		var vectorValue = new VectorValue();
		for (value in this.vector) {
			vectorValue.insert(value.not());
		}
		return vectorValue;
	}
	
	@:allow(model.gates.XOR)
	@:allow(model.values.instantaneousValues.InstantaneousValueI)
	function xor(instantaneousValue: InstantaneousValueI) : InstantaneousValueI {
		if (Std.is(instantaneousValue, ScalarValueI)) {
			return instantaneousValue.xor(this);
		} else {
			// Vector-Vector AND case
			// TODO : Understand this better
			return this;
		}
	}
}
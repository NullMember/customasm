use diagn::Span;
use num::BigInt;


#[derive(Debug)]
pub enum Expression
{
	Literal(Span, ExpressionValue),
	Variable(Span, String),
	UnaryOp(Span, Span, UnaryOp, Box<Expression>),
	BinaryOp(Span, Span, BinaryOp, Box<Expression>, Box<Expression>),
	BitSlice(Span, Span, usize, usize, Box<Expression>),
	Block(Span, Vec<Expression>),
	Call(Span, Box<Expression>, Vec<Expression>)
}


#[derive(Clone, Debug, Eq, PartialEq)]
pub enum ExpressionValue
{
	Void,
	Integer(BigInt),
	Bool(bool),
	String(String),
	Function(usize)
}


#[derive(Copy, Clone, Debug)]
pub enum UnaryOp
{
	Neg,
	Not
}


#[derive(Copy, Clone, Debug)]
pub enum BinaryOp
{
	Add, Sub, Mul, Div, Mod,
	Shl, Shr,
	And, Or, Xor,
	
	Eq, Ne,
	Lt, Le,
	Gt, Ge,
	
	LazyAnd, LazyOr,
	
	Concat
}


impl Expression
{
	pub fn span(&self) -> Span
	{
		match self
		{
			&Expression::Literal (ref span, ..) => span.clone(),
			&Expression::Variable(ref span, ..) => span.clone(),
			&Expression::UnaryOp (ref span, ..) => span.clone(),
			&Expression::BinaryOp(ref span, ..) => span.clone(),
			&Expression::BitSlice(ref span, ..) => span.clone(),
			&Expression::Block   (ref span, ..) => span.clone(),
			&Expression::Call    (ref span, ..) => span.clone()
		}
	}
}
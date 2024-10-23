(** Copyright 2024, raf-nr and ksenmel *)

(** SPDX-License-Identifier: LGPL-3.0-or-later *)

type identifier = string [@@deriving show { with_path = false }]

type constant =
  | CInt of int (** -1, 0, 1, ... *)
  | CBool of bool (** true, false *)
  | CChar of char (** 'a', 'b', 'c', ... *)
  | CString of string (** "Hello world!" *)
  | CUnit of unit (** () *)
[@@deriving show { with_path = false }]

type pattern =
  | PAny (* Wildcard: '_' *)
  | PNill (* Empty: '[]' *)
  | PConst of constant (** Any constant: '1', 'true', etc *)
  | PVar of identifier (** A variable pattern: 'x', 'y', etc *)
  | POr of pattern * pattern (** 'P1 | P2' *)
  | PTuple of pattern list (** Tuple of patterns: '(P1, P2, P3)' *)
  | PListConstructor of pattern * pattern (** List construction pattern: 'P1::P2' *)
[@@deriving show { with_path = false }]

type expression =
  | EConstant of constant (** Any constant: '1', 'true', etc *)
  | EIdentifier of identifier (** A variable name: 'x', 'y', etc *)
  | EFun of pattern list * expression (** Anonymous function: 'fun x -> x' *)
  | EApplication of expression * expression list (** Application: f x *)
  | EIfThenElse of expression * expression * expression option (* if condition then true_branch else false branch (else option)*)
  | ETuple of expression list (** Tuple: '(E1, E2, ..., En)' *)
  | EEmptyList (** Empty list: '[]' *)
  | EListConstructor of expression * expression (** Contructor of list: 'hd :: md :: tl' *)
  | EMatchWith of expression * (pattern * expression) list (** Pattern matching: match x with | y -> y *)
  | ELetIn of pattern * expression * expression (** Let in: 'let f x = x in f 5 *)
  | ERecLetIn of pattern * expression * expression (** Recursive let in: 'let rec f x = if x = 1 then 1 else x + f (x-1)'*)
[@@deriving show { with_path = false }]

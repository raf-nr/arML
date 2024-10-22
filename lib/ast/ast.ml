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

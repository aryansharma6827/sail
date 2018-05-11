chapter \<open>Generated by Lem from ../../src/gen_lib/sail_operators_mwords.lem.\<close>

theory "Sail_operators_mwords" 

imports 
 	 Main
	 "Lem_pervasives_extra" 
	 "Lem_machine_word" 
	 "Sail_values" 
	 "Sail_operators" 
	 "Prompt_monad" 
	 "Prompt" 

begin 

(*open import Pervasives_extra*)
(*open import Machine_word*)
(*open import Sail_values*)
(*open import Sail_operators*)
(*open import Prompt_monad*)
(*open import Prompt*)
definition uint_maybe  :: "('a::len)Word.word \<Rightarrow>(int)option "  where 
     " uint_maybe v = ( Some (Word.uint v))"

definition uint_fail  :: "('a::len)Word.word \<Rightarrow>('c,(int),'b)monad "  where 
     " uint_fail v = ( return (Word.uint v))"

definition uint_oracle  :: "('a::len)Word.word \<Rightarrow>('c,(int),'b)monad "  where 
     " uint_oracle v = ( return (Word.uint v))"

definition sint_maybe  :: "('a::len)Word.word \<Rightarrow>(int)option "  where 
     " sint_maybe v = ( Some (Word.sint v))"

definition sint_fail  :: "('a::len)Word.word \<Rightarrow>('c,(int),'b)monad "  where 
     " sint_fail v = ( return (Word.sint v))"

definition sint_oracle  :: "('a::len)Word.word \<Rightarrow>('c,(int),'b)monad "  where 
     " sint_oracle v = ( return (Word.sint v))"


(*val vec_of_bits_maybe    : forall 'a. Size 'a => list bitU -> maybe (mword 'a)*)
(*val vec_of_bits_fail     : forall 'rv 'a 'e. Size 'a => list bitU -> monad 'rv (mword 'a) 'e*)
(*val vec_of_bits_oracle   : forall 'rv 'a 'e. Size 'a => list bitU -> monad 'rv (mword 'a) 'e*)
(*val vec_of_bits_failwith : forall 'a. Size 'a => list bitU -> mword 'a*)
(*val vec_of_bits          : forall 'a. Size 'a => list bitU -> mword 'a*)
definition vec_of_bits_maybe  :: "(bitU)list \<Rightarrow>(('a::len)Word.word)option "  where 
     " vec_of_bits_maybe bits = ( map_option Word.of_bl (just_list (List.map bool_of_bitU bits)))"

definition vec_of_bits_fail  :: "(bitU)list \<Rightarrow>('rv,(('a::len)Word.word),'e)monad "  where 
     " vec_of_bits_fail bits = ( of_bits_fail 
  instance_Sail_values_Bitvector_Machine_word_mword_dict bits )"

definition vec_of_bits_oracle  :: "(bitU)list \<Rightarrow>('rv,(('a::len)Word.word),'e)monad "  where 
     " vec_of_bits_oracle bits = ( of_bits_oracle 
  instance_Sail_values_Bitvector_Machine_word_mword_dict bits )"

definition vec_of_bits_failwith  :: "(bitU)list \<Rightarrow>('a::len)Word.word "  where 
     " vec_of_bits_failwith bits = ( of_bits_failwith 
  instance_Sail_values_Bitvector_Machine_word_mword_dict bits )"

definition vec_of_bits  :: "(bitU)list \<Rightarrow>('a::len)Word.word "  where 
     " vec_of_bits bits = ( of_bits_failwith 
  instance_Sail_values_Bitvector_Machine_word_mword_dict bits )"


(*val access_vec_inc : forall 'a. Size 'a => mword 'a -> integer -> bitU*)
definition access_vec_inc  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow> bitU "  where 
     " access_vec_inc = ( 
  access_bv_inc instance_Sail_values_Bitvector_Machine_word_mword_dict )"


(*val access_vec_dec : forall 'a. Size 'a => mword 'a -> integer -> bitU*)
definition access_vec_dec  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow> bitU "  where 
     " access_vec_dec = ( 
  access_bv_dec instance_Sail_values_Bitvector_Machine_word_mword_dict )"


definition update_vec_dec_maybe  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow> bitU \<Rightarrow>(('a::len)Word.word)option "  where 
     " update_vec_dec_maybe w i b = ( update_mword_dec w i b )"

definition update_vec_dec_fail  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow> bitU \<Rightarrow>('c,(('a::len)Word.word),'b)monad "  where 
     " update_vec_dec_fail w i b = (
  bool_of_bitU_fail b \<bind> (\<lambda> b . 
  return (update_mword_bool_dec w i b)))"

definition update_vec_dec_oracle  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow> bitU \<Rightarrow>('c,(('a::len)Word.word),'b)monad "  where 
     " update_vec_dec_oracle w i b = (
  bool_of_bitU_oracle b \<bind> (\<lambda> b . 
  return (update_mword_bool_dec w i b)))"

definition update_vec_dec  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow> bitU \<Rightarrow>('a::len)Word.word "  where 
     " update_vec_dec w i b = ( maybe_failwith (update_vec_dec_maybe w i b))"


definition update_vec_inc_maybe  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow> bitU \<Rightarrow>(('a::len)Word.word)option "  where 
     " update_vec_inc_maybe w i b = ( update_mword_inc w i b )"

definition update_vec_inc_fail  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow> bitU \<Rightarrow>('c,(('a::len)Word.word),'b)monad "  where 
     " update_vec_inc_fail w i b = (
  bool_of_bitU_fail b \<bind> (\<lambda> b . 
  return (update_mword_bool_inc w i b)))"

definition update_vec_inc_oracle  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow> bitU \<Rightarrow>('c,(('a::len)Word.word),'b)monad "  where 
     " update_vec_inc_oracle w i b = (
  bool_of_bitU_oracle b \<bind> (\<lambda> b . 
  return (update_mword_bool_inc w i b)))"

definition update_vec_inc  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow> bitU \<Rightarrow>('a::len)Word.word "  where 
     " update_vec_inc w i b = ( maybe_failwith (update_vec_inc_maybe w i b))"


(*val subrange_vec_dec : forall 'a 'b. Size 'a, Size 'b => mword 'a -> integer -> integer -> mword 'b*)
definition subrange_vec_dec  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow> int \<Rightarrow>('b::len)Word.word "  where 
     " subrange_vec_dec w i j = ( Word.slice (nat_of_int j) w )"


(*val subrange_vec_inc : forall 'a 'b. Size 'a, Size 'b => mword 'a -> integer -> integer -> mword 'b*)
definition subrange_vec_inc  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow> int \<Rightarrow>('b::len)Word.word "  where 
     " subrange_vec_inc w i j = ( subrange_vec_dec w ((int (size w) -( 1 :: int)) - i) ((int (size w) -( 1 :: int)) - j))"


(*val update_subrange_vec_dec : forall 'a 'b. Size 'a, Size 'b => mword 'a -> integer -> integer -> mword 'b -> mword 'a*)
definition update_subrange_vec_dec  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow> int \<Rightarrow>('b::len)Word.word \<Rightarrow>('a::len)Word.word "  where 
     " update_subrange_vec_dec w i j w' = ( Lem.word_update w (nat_of_int j) (nat_of_int i) w' )"


(*val update_subrange_vec_inc : forall 'a 'b. Size 'a, Size 'b => mword 'a -> integer -> integer -> mword 'b -> mword 'a*)
definition update_subrange_vec_inc  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow> int \<Rightarrow>('b::len)Word.word \<Rightarrow>('a::len)Word.word "  where 
     " update_subrange_vec_inc w i j w' = ( update_subrange_vec_dec w ((int (size w) -( 1 :: int)) - i) ((int (size w) -( 1 :: int)) - j) w' )"


(*val extz_vec : forall 'a 'b. Size 'a, Size 'b => integer -> mword 'a -> mword 'b*)
definition extz_vec  :: " int \<Rightarrow>('a::len)Word.word \<Rightarrow>('b::len)Word.word "  where 
     " extz_vec _ w = ( Word.ucast w )"


(*val exts_vec : forall 'a 'b. Size 'a, Size 'b => integer -> mword 'a -> mword 'b*)
definition exts_vec  :: " int \<Rightarrow>('a::len)Word.word \<Rightarrow>('b::len)Word.word "  where 
     " exts_vec _ w = ( Word.scast w )"


(*val zero_extend : forall 'a 'b. Size 'a, Size 'b => mword 'a -> integer -> mword 'b*)
definition zero_extend  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow>('b::len)Word.word "  where 
     " zero_extend w _ = ( Word.ucast w )"


(*val sign_extend : forall 'a 'b. Size 'a, Size 'b => mword 'a -> integer -> mword 'b*)
definition sign_extend  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow>('b::len)Word.word "  where 
     " sign_extend w _ = ( Word.scast w )"


(*val zeros : forall 'a. Size 'a => integer -> mword 'a*)
definition zeros  :: " int \<Rightarrow>('a::len)Word.word "  where 
     " zeros _ = ( Word.word_of_int (int(( 0 :: nat))))"


(*val vector_truncate : forall 'a 'b. Size 'a, Size 'b => mword 'a -> integer -> mword 'b*)
definition vector_truncate  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow>('b::len)Word.word "  where 
     " vector_truncate w _ = ( Word.ucast w )"


(*val concat_vec : forall 'a 'b 'c. Size 'a, Size 'b, Size 'c => mword 'a -> mword 'b -> mword 'c*)
definition concat_vec  :: "('a::len)Word.word \<Rightarrow>('b::len)Word.word \<Rightarrow>('c::len)Word.word "  where 
     " concat_vec = ( Word.word_cat )"


(*val cons_vec_bool : forall 'a 'b 'c. Size 'a, Size 'b => bool -> mword 'a -> mword 'b*)
definition cons_vec_bool  :: " bool \<Rightarrow>('a::len)Word.word \<Rightarrow>('b::len)Word.word "  where 
     " cons_vec_bool b w = ( Word.of_bl (b # Word.to_bl w))"

definition cons_vec_maybe  :: " bitU \<Rightarrow>('c::len)Word.word \<Rightarrow>(('b::len)Word.word)option "  where 
     " cons_vec_maybe b w = ( map_option (\<lambda> b .  cons_vec_bool b w) (bool_of_bitU b))"

definition cons_vec_fail  :: " bitU \<Rightarrow>('c::len)Word.word \<Rightarrow>('e,(('b::len)Word.word),'d)monad "  where 
     " cons_vec_fail b w = ( bool_of_bitU_fail b \<bind> (\<lambda> b .  return (cons_vec_bool b w)))"

definition cons_vec_oracle  :: " bitU \<Rightarrow>('c::len)Word.word \<Rightarrow>('e,(('b::len)Word.word),'d)monad "  where 
     " cons_vec_oracle b w = ( bool_of_bitU_oracle b \<bind> (\<lambda> b .  return (cons_vec_bool b w)))"

definition cons_vec  :: " bitU \<Rightarrow>('a::len)Word.word \<Rightarrow>('b::len)Word.word "  where 
     " cons_vec b w = ( maybe_failwith (cons_vec_maybe b w))"


(*val vec_of_bool : forall 'a. Size 'a => integer -> bool -> mword 'a*)
definition vec_of_bool  :: " int \<Rightarrow> bool \<Rightarrow>('a::len)Word.word "  where 
     " vec_of_bool _ b = ( Word.of_bl [b])"

definition vec_of_bit_maybe  :: " int \<Rightarrow> bitU \<Rightarrow>(('a::len)Word.word)option "  where 
     " vec_of_bit_maybe len b = ( map_option (vec_of_bool len) (bool_of_bitU b))"

definition vec_of_bit_fail  :: " int \<Rightarrow> bitU \<Rightarrow>('c,(('a::len)Word.word),'b)monad "  where 
     " vec_of_bit_fail len b = ( bool_of_bitU_fail b \<bind> (\<lambda> b .  return (vec_of_bool len b)))"

definition vec_of_bit_oracle  :: " int \<Rightarrow> bitU \<Rightarrow>('c,(('a::len)Word.word),'b)monad "  where 
     " vec_of_bit_oracle len b = ( bool_of_bitU_oracle b \<bind> (\<lambda> b .  return (vec_of_bool len b)))"

definition vec_of_bit  :: " int \<Rightarrow> bitU \<Rightarrow>('a::len)Word.word "  where 
     " vec_of_bit len b = ( maybe_failwith (vec_of_bit_maybe len b))"


(*val cast_bool_vec : bool -> mword ty1*)
definition cast_bool_vec  :: " bool \<Rightarrow>(1)Word.word "  where 
     " cast_bool_vec b = ( vec_of_bool(( 1 :: int)) b )"

definition cast_unit_vec_maybe  :: " bitU \<Rightarrow>(('a::len)Word.word)option "  where 
     " cast_unit_vec_maybe b = ( vec_of_bit_maybe(( 1 :: int)) b )"

definition cast_unit_vec_fail  :: " bitU \<Rightarrow>('b,((1)Word.word),'a)monad "  where 
     " cast_unit_vec_fail b = ( bool_of_bitU_fail b \<bind> (\<lambda> b .  return (cast_bool_vec b)))"

definition cast_unit_vec_oracle  :: " bitU \<Rightarrow>('b,((1)Word.word),'a)monad "  where 
     " cast_unit_vec_oracle b = ( bool_of_bitU_oracle b \<bind> (\<lambda> b .  return (cast_bool_vec b)))"

definition cast_unit_vec  :: " bitU \<Rightarrow>('a::len)Word.word "  where 
     " cast_unit_vec b = ( maybe_failwith (cast_unit_vec_maybe b))"


(*val msb : forall 'a. Size 'a => mword 'a -> bitU*)
definition msb  :: "('a::len)Word.word \<Rightarrow> bitU "  where 
     " msb = ( 
  most_significant instance_Sail_values_Bitvector_Machine_word_mword_dict )"


(*val int_of_vec : forall 'a. Size 'a => bool -> mword 'a -> integer*)
definition int_of_vec  :: " bool \<Rightarrow>('a::len)Word.word \<Rightarrow> int "  where 
     " int_of_vec sign w = (
  if sign
  then Word.sint w
  else Word.uint w )"

definition int_of_vec_maybe  :: " bool \<Rightarrow>('a::len)Word.word \<Rightarrow>(int)option "  where 
     " int_of_vec_maybe sign w = ( Some (int_of_vec sign w))"

definition int_of_vec_fail  :: " bool \<Rightarrow>('a::len)Word.word \<Rightarrow>('c,(int),'b)monad "  where 
     " int_of_vec_fail sign w = ( return (int_of_vec sign w))"


(*val string_of_vec : forall 'a. Size 'a => mword 'a -> string*)
definition string_of_vec  :: "('a::len)Word.word \<Rightarrow> string "  where 
     " string_of_vec = ( 
  string_of_bv instance_Sail_values_Bitvector_Machine_word_mword_dict )"


(*val and_vec : forall 'a. Size 'a => mword 'a -> mword 'a -> mword 'a*)
(*val or_vec  : forall 'a. Size 'a => mword 'a -> mword 'a -> mword 'a*)
(*val xor_vec : forall 'a. Size 'a => mword 'a -> mword 'a -> mword 'a*)
(*val not_vec : forall 'a. Size 'a => mword 'a -> mword 'a*)
definition and_vec  :: "('a::len)Word.word \<Rightarrow>('a::len)Word.word \<Rightarrow>('a::len)Word.word "  where 
     " and_vec = ( Bits.bitAND )"

definition or_vec  :: "('a::len)Word.word \<Rightarrow>('a::len)Word.word \<Rightarrow>('a::len)Word.word "   where 
     " or_vec  = ( Bits.bitOR )"

definition xor_vec  :: "('a::len)Word.word \<Rightarrow>('a::len)Word.word \<Rightarrow>('a::len)Word.word "  where 
     " xor_vec = ( Bits.bitXOR )"

definition not_vec  :: "('a::len)Word.word \<Rightarrow>('a::len)Word.word "  where 
     " not_vec = ( Bits.bitNOT )"


(*val add_vec   : forall 'a. Size 'a => mword 'a -> mword 'a -> mword 'a*)
(*val adds_vec  : forall 'a. Size 'a => mword 'a -> mword 'a -> mword 'a*)
(*val sub_vec   : forall 'a. Size 'a => mword 'a -> mword 'a -> mword 'a*)
(*val subs_vec  : forall 'a. Size 'a => mword 'a -> mword 'a -> mword 'a*)
(*val mult_vec  : forall 'a 'b. Size 'a, Size 'b => mword 'a -> mword 'a -> mword 'b*)
(*val mults_vec : forall 'a 'b. Size 'a, Size 'b => mword 'a -> mword 'a -> mword 'b*)
definition add_vec  :: "('a::len)Word.word \<Rightarrow>('a::len)Word.word \<Rightarrow>('a::len)Word.word "  where 
     " add_vec   l r = ( Word.word_of_int ((int_of_mword False l) + (int_of_mword False r)))"

definition adds_vec  :: "('a::len)Word.word \<Rightarrow>('a::len)Word.word \<Rightarrow>('a::len)Word.word "  where 
     " adds_vec  l r = ( Word.word_of_int ((int_of_mword True l) + (int_of_mword True r)))"

definition sub_vec  :: "('a::len)Word.word \<Rightarrow>('a::len)Word.word \<Rightarrow>('a::len)Word.word "  where 
     " sub_vec   l r = ( Word.word_of_int ((int_of_mword False l) - (int_of_mword False r)))"

definition subs_vec  :: "('a::len)Word.word \<Rightarrow>('a::len)Word.word \<Rightarrow>('a::len)Word.word "  where 
     " subs_vec  l r = ( Word.word_of_int ((int_of_mword True l) - (int_of_mword True r)))"

definition mult_vec  :: "('a::len)Word.word \<Rightarrow>('a::len)Word.word \<Rightarrow>('b::len)Word.word "  where 
     " mult_vec  l r = ( Word.word_of_int ((int_of_mword False (Word.ucast l :: ( 'b::len)Word.word)) * (int_of_mword False (Word.ucast r :: ( 'b::len)Word.word))))"

definition mults_vec  :: "('a::len)Word.word \<Rightarrow>('a::len)Word.word \<Rightarrow>('b::len)Word.word "  where 
     " mults_vec l r = ( Word.word_of_int ((int_of_mword True (Word.scast l :: ( 'b::len)Word.word)) * (int_of_mword True (Word.scast r :: ( 'b::len)Word.word))))"


(*val add_vec_int   : forall 'a. Size 'a => mword 'a -> integer -> mword 'a*)
(*val adds_vec_int  : forall 'a. Size 'a => mword 'a -> integer -> mword 'a*)
(*val sub_vec_int   : forall 'a. Size 'a => mword 'a -> integer -> mword 'a*)
(*val subs_vec_int  : forall 'a. Size 'a => mword 'a -> integer -> mword 'a*)
(*val mult_vec_int  : forall 'a 'b. Size 'a, Size 'b => mword 'a -> integer -> mword 'b*)
(*val mults_vec_int : forall 'a 'b. Size 'a, Size 'b => mword 'a -> integer -> mword 'b*)
definition add_vec_int  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow>('a::len)Word.word "  where 
     " add_vec_int   l r = ( arith_op_bv_int 
  instance_Sail_values_Bitvector_Machine_word_mword_dict (op+)   False l r )"

definition adds_vec_int  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow>('a::len)Word.word "  where 
     " adds_vec_int  l r = ( arith_op_bv_int 
  instance_Sail_values_Bitvector_Machine_word_mword_dict (op+)   True  l r )"

definition sub_vec_int  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow>('a::len)Word.word "  where 
     " sub_vec_int   l r = ( arith_op_bv_int 
  instance_Sail_values_Bitvector_Machine_word_mword_dict (op-) False l r )"

definition subs_vec_int  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow>('a::len)Word.word "  where 
     " subs_vec_int  l r = ( arith_op_bv_int 
  instance_Sail_values_Bitvector_Machine_word_mword_dict (op-) True  l r )"

definition mult_vec_int  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow>('b::len)Word.word "  where 
     " mult_vec_int  l r = ( arith_op_bv_int 
  instance_Sail_values_Bitvector_Machine_word_mword_dict (op*)  False (Word.ucast l :: ( 'b::len)Word.word) r )"

definition mults_vec_int  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow>('b::len)Word.word "  where 
     " mults_vec_int l r = ( arith_op_bv_int 
  instance_Sail_values_Bitvector_Machine_word_mword_dict (op*)  True  (Word.scast l :: ( 'b::len)Word.word) r )"


(*val add_int_vec   : forall 'a. Size 'a => integer -> mword 'a -> mword 'a*)
(*val adds_int_vec  : forall 'a. Size 'a => integer -> mword 'a -> mword 'a*)
(*val sub_int_vec   : forall 'a. Size 'a => integer -> mword 'a -> mword 'a*)
(*val subs_int_vec  : forall 'a. Size 'a => integer -> mword 'a -> mword 'a*)
(*val mult_int_vec  : forall 'a 'b. Size 'a, Size 'b => integer -> mword 'a -> mword 'b*)
(*val mults_int_vec : forall 'a 'b. Size 'a, Size 'b => integer -> mword 'a -> mword 'b*)
definition add_int_vec  :: " int \<Rightarrow>('a::len)Word.word \<Rightarrow>('a::len)Word.word "  where 
     " add_int_vec   l r = ( arith_op_int_bv 
  instance_Sail_values_Bitvector_Machine_word_mword_dict (op+)   False l r )"

definition adds_int_vec  :: " int \<Rightarrow>('a::len)Word.word \<Rightarrow>('a::len)Word.word "  where 
     " adds_int_vec  l r = ( arith_op_int_bv 
  instance_Sail_values_Bitvector_Machine_word_mword_dict (op+)   True  l r )"

definition sub_int_vec  :: " int \<Rightarrow>('a::len)Word.word \<Rightarrow>('a::len)Word.word "  where 
     " sub_int_vec   l r = ( arith_op_int_bv 
  instance_Sail_values_Bitvector_Machine_word_mword_dict (op-) False l r )"

definition subs_int_vec  :: " int \<Rightarrow>('a::len)Word.word \<Rightarrow>('a::len)Word.word "  where 
     " subs_int_vec  l r = ( arith_op_int_bv 
  instance_Sail_values_Bitvector_Machine_word_mword_dict (op-) True  l r )"

definition mult_int_vec  :: " int \<Rightarrow>('a::len)Word.word \<Rightarrow>('b::len)Word.word "  where 
     " mult_int_vec  l r = ( arith_op_int_bv 
  instance_Sail_values_Bitvector_Machine_word_mword_dict (op*)  False l (Word.ucast r :: ( 'b::len)Word.word))"

definition mults_int_vec  :: " int \<Rightarrow>('a::len)Word.word \<Rightarrow>('b::len)Word.word "  where 
     " mults_int_vec l r = ( arith_op_int_bv 
  instance_Sail_values_Bitvector_Machine_word_mword_dict (op*)  True  l (Word.scast r :: ( 'b::len)Word.word))"


(*val add_vec_bool  : forall 'a. Size 'a => mword 'a -> bool -> mword 'a*)
(*val adds_vec_bool : forall 'a. Size 'a => mword 'a -> bool -> mword 'a*)
(*val sub_vec_bool  : forall 'a. Size 'a => mword 'a -> bool -> mword 'a*)
(*val subs_vec_bool : forall 'a. Size 'a => mword 'a -> bool -> mword 'a*)

definition add_vec_bool  :: "('a::len)Word.word \<Rightarrow> bool \<Rightarrow>('a::len)Word.word "  where 
     " add_vec_bool        l r = ( arith_op_bv_bool 
  instance_Sail_values_Bitvector_Machine_word_mword_dict (op+) False l r )"

definition add_vec_bit_maybe  :: "('a::len)Word.word \<Rightarrow> bitU \<Rightarrow>(('a::len)Word.word)option "  where 
     " add_vec_bit_maybe   l r = ( map_option (add_vec_bool l) (bool_of_bitU r))"

definition add_vec_bit_fail  :: "('a::len)Word.word \<Rightarrow> bitU \<Rightarrow>('c,(('a::len)Word.word),'b)monad "  where 
     " add_vec_bit_fail    l r = ( bool_of_bitU_fail r \<bind> (\<lambda> r .  return (add_vec_bool l r)))"

definition add_vec_bit_oracle  :: "('a::len)Word.word \<Rightarrow> bitU \<Rightarrow>('c,(('a::len)Word.word),'b)monad "  where 
     " add_vec_bit_oracle  l r = ( bool_of_bitU_oracle r \<bind> (\<lambda> r .  return (add_vec_bool l r)))"

definition add_vec_bit  :: "('a::len)Word.word \<Rightarrow> bitU \<Rightarrow>('a::len)Word.word "  where 
     " add_vec_bit         l r = ( maybe_failwith (add_vec_bit_maybe  l r))"


definition adds_vec_bool  :: "('a::len)Word.word \<Rightarrow> bool \<Rightarrow>('a::len)Word.word "  where 
     " adds_vec_bool       l r = ( arith_op_bv_bool 
  instance_Sail_values_Bitvector_Machine_word_mword_dict (op+) True  l r )"

definition adds_vec_bit_maybe  :: "('a::len)Word.word \<Rightarrow> bitU \<Rightarrow>(('a::len)Word.word)option "  where 
     " adds_vec_bit_maybe  l r = ( map_option (adds_vec_bool l) (bool_of_bitU r))"

definition adds_vec_bit_fail  :: "('a::len)Word.word \<Rightarrow> bitU \<Rightarrow>('c,(('a::len)Word.word),'b)monad "  where 
     " adds_vec_bit_fail   l r = ( bool_of_bitU_fail r \<bind> (\<lambda> r .  return (adds_vec_bool l r)))"

definition adds_vec_bit_oracle  :: "('a::len)Word.word \<Rightarrow> bitU \<Rightarrow>('c,(('a::len)Word.word),'b)monad "  where 
     " adds_vec_bit_oracle l r = ( bool_of_bitU_oracle r \<bind> (\<lambda> r .  return (adds_vec_bool l r)))"

definition adds_vec_bit  :: "('a::len)Word.word \<Rightarrow> bitU \<Rightarrow>('a::len)Word.word "  where 
     " adds_vec_bit        l r = ( maybe_failwith (adds_vec_bit_maybe l r))"


definition sub_vec_bool  :: "('a::len)Word.word \<Rightarrow> bool \<Rightarrow>('a::len)Word.word "  where 
     " sub_vec_bool        l r = ( arith_op_bv_bool 
  instance_Sail_values_Bitvector_Machine_word_mword_dict (op-) False l r )"

definition sub_vec_bit_maybe  :: "('a::len)Word.word \<Rightarrow> bitU \<Rightarrow>(('a::len)Word.word)option "  where 
     " sub_vec_bit_maybe   l r = ( map_option (sub_vec_bool l) (bool_of_bitU r))"

definition sub_vec_bit_fail  :: "('a::len)Word.word \<Rightarrow> bitU \<Rightarrow>('c,(('a::len)Word.word),'b)monad "  where 
     " sub_vec_bit_fail    l r = ( bool_of_bitU_fail r \<bind> (\<lambda> r .  return (sub_vec_bool l r)))"

definition sub_vec_bit_oracle  :: "('a::len)Word.word \<Rightarrow> bitU \<Rightarrow>('c,(('a::len)Word.word),'b)monad "  where 
     " sub_vec_bit_oracle  l r = ( bool_of_bitU_oracle r \<bind> (\<lambda> r .  return (sub_vec_bool l r)))"

definition sub_vec_bit  :: "('a::len)Word.word \<Rightarrow> bitU \<Rightarrow>('a::len)Word.word "  where 
     " sub_vec_bit         l r = ( maybe_failwith (sub_vec_bit_maybe  l r))"


definition subs_vec_bool  :: "('a::len)Word.word \<Rightarrow> bool \<Rightarrow>('a::len)Word.word "  where 
     " subs_vec_bool       l r = ( arith_op_bv_bool 
  instance_Sail_values_Bitvector_Machine_word_mword_dict (op-) True  l r )"

definition subs_vec_bit_maybe  :: "('a::len)Word.word \<Rightarrow> bitU \<Rightarrow>(('a::len)Word.word)option "  where 
     " subs_vec_bit_maybe  l r = ( map_option (subs_vec_bool l) (bool_of_bitU r))"

definition subs_vec_bit_fail  :: "('a::len)Word.word \<Rightarrow> bitU \<Rightarrow>('c,(('a::len)Word.word),'b)monad "  where 
     " subs_vec_bit_fail   l r = ( bool_of_bitU_fail r \<bind> (\<lambda> r .  return (subs_vec_bool l r)))"

definition subs_vec_bit_oracle  :: "('a::len)Word.word \<Rightarrow> bitU \<Rightarrow>('c,(('a::len)Word.word),'b)monad "  where 
     " subs_vec_bit_oracle l r = ( bool_of_bitU_oracle r \<bind> (\<lambda> r .  return (subs_vec_bool l r)))"

definition subs_vec_bit  :: "('a::len)Word.word \<Rightarrow> bitU \<Rightarrow>('a::len)Word.word "  where 
     " subs_vec_bit        l r = ( maybe_failwith (subs_vec_bit_maybe  l r))"


(* TODO
val maybe_mword_of_bits_overflow : forall 'a. Size 'a => (list bitU * bitU * bitU) -> maybe (mword 'a * bitU * bitU)
let maybe_mword_of_bits_overflow (bits, overflow, carry) =
  Maybe.map (fun w -> (w, overflow, carry)) (of_bits bits)

val add_overflow_vec   : forall 'a. Size 'a => mword 'a -> mword 'a -> maybe (mword 'a * bitU * bitU)
val adds_overflow_vec  : forall 'a. Size 'a => mword 'a -> mword 'a -> maybe (mword 'a * bitU * bitU)
val sub_overflow_vec   : forall 'a. Size 'a => mword 'a -> mword 'a -> maybe (mword 'a * bitU * bitU)
val subs_overflow_vec  : forall 'a. Size 'a => mword 'a -> mword 'a -> maybe (mword 'a * bitU * bitU)
val mult_overflow_vec  : forall 'a. Size 'a => mword 'a -> mword 'a -> maybe (mword 'a * bitU * bitU)
val mults_overflow_vec : forall 'a. Size 'a => mword 'a -> mword 'a -> maybe (mword 'a * bitU * bitU)
let add_overflow_vec   l r = maybe_mword_of_bits_overflow (add_overflow_bv l r)
let adds_overflow_vec  l r = maybe_mword_of_bits_overflow (adds_overflow_bv l r)
let sub_overflow_vec   l r = maybe_mword_of_bits_overflow (sub_overflow_bv l r)
let subs_overflow_vec  l r = maybe_mword_of_bits_overflow (subs_overflow_bv l r)
let mult_overflow_vec  l r = maybe_mword_of_bits_overflow (mult_overflow_bv l r)
let mults_overflow_vec l r = maybe_mword_of_bits_overflow (mults_overflow_bv l r)

val add_overflow_vec_bit         : forall 'a. Size 'a => mword 'a -> bitU -> (mword 'a * bitU * bitU)
val add_overflow_vec_bit_signed  : forall 'a. Size 'a => mword 'a -> bitU -> (mword 'a * bitU * bitU)
val sub_overflow_vec_bit         : forall 'a. Size 'a => mword 'a -> bitU -> (mword 'a * bitU * bitU)
val sub_overflow_vec_bit_signed  : forall 'a. Size 'a => mword 'a -> bitU -> (mword 'a * bitU * bitU)
let add_overflow_vec_bit         = add_overflow_bv_bit
let add_overflow_vec_bit_signed  = add_overflow_bv_bit_signed
let sub_overflow_vec_bit         = sub_overflow_bv_bit
let sub_overflow_vec_bit_signed  = sub_overflow_bv_bit_signed*)

(*val shiftl       : forall 'a. Size 'a => mword 'a -> integer -> mword 'a*)
(*val shiftr       : forall 'a. Size 'a => mword 'a -> integer -> mword 'a*)
(*val arith_shiftr : forall 'a. Size 'a => mword 'a -> integer -> mword 'a*)
(*val rotl         : forall 'a. Size 'a => mword 'a -> integer -> mword 'a*)
(*val rotr         : forall 'a. Size 'a => mword 'a -> integer -> mword 'a*)
definition shiftl  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow>('a::len)Word.word "        where 
     " shiftl       = ( shiftl_mword )"

definition shiftr  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow>('a::len)Word.word "        where 
     " shiftr       = ( shiftr_mword )"

definition arith_shiftr  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow>('a::len)Word.word "  where 
     " arith_shiftr = ( arith_shiftr_mword )"

definition rotl  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow>('a::len)Word.word "          where 
     " rotl         = ( rotl_mword )"

definition rotr  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow>('a::len)Word.word "          where 
     " rotr         = ( rotr_mword )"


(*val mod_vec        : forall 'a. Size 'a => mword 'a -> mword 'a -> mword 'a*)
(*val mod_vec_maybe  : forall 'a. Size 'a => mword 'a -> mword 'a -> maybe (mword 'a)*)
(*val mod_vec_fail   : forall 'rv 'a 'e. Size 'a => mword 'a -> mword 'a -> monad 'rv (mword 'a) 'e*)
(*val mod_vec_oracle : forall 'rv 'a 'e. Size 'a => mword 'a -> mword 'a -> monad 'rv (mword 'a) 'e*)
definition mod_vec  :: "('a::len)Word.word \<Rightarrow>('a::len)Word.word \<Rightarrow>('a::len)Word.word "  where 
     " mod_vec        l r = ( mod_mword l r )"

definition mod_vec_maybe  :: "('a::len)Word.word \<Rightarrow>('a::len)Word.word \<Rightarrow>(('a::len)Word.word)option "  where 
     " mod_vec_maybe  l r = ( mod_bv 
  instance_Sail_values_Bitvector_Machine_word_mword_dict instance_Sail_values_Bitvector_Machine_word_mword_dict l r )"

definition mod_vec_fail  :: "('a::len)Word.word \<Rightarrow>('a::len)Word.word \<Rightarrow>('rv,(('a::len)Word.word),'e)monad "  where 
     " mod_vec_fail   l r = ( maybe_fail (''mod_vec'') (mod_bv 
  instance_Sail_values_Bitvector_Machine_word_mword_dict instance_Sail_values_Bitvector_Machine_word_mword_dict l r))"

definition mod_vec_oracle  :: "('a::len)Word.word \<Rightarrow>('a::len)Word.word \<Rightarrow>('rv,(('a::len)Word.word),'e)monad "  where 
     " mod_vec_oracle l r = (
  (case  (mod_bv instance_Sail_values_Bitvector_Machine_word_mword_dict instance_Sail_values_Bitvector_Machine_word_mword_dict l r) of
      Some w => return w
    | None => mword_oracle () 
  ))"


(*val quot_vec        : forall 'a. Size 'a => mword 'a -> mword 'a -> mword 'a*)
(*val quot_vec_maybe  : forall 'a. Size 'a => mword 'a -> mword 'a -> maybe (mword 'a)*)
(*val quot_vec_fail   : forall 'rv 'a 'e. Size 'a => mword 'a -> mword 'a -> monad 'rv (mword 'a) 'e*)
(*val quot_vec_oracle : forall 'rv 'a 'e. Size 'a => mword 'a -> mword 'a -> monad 'rv (mword 'a) 'e*)
definition quot_vec  :: "('a::len)Word.word \<Rightarrow>('a::len)Word.word \<Rightarrow>('a::len)Word.word "  where 
     " quot_vec        l r = ( quot_mword l r )"

definition quot_vec_maybe  :: "('a::len)Word.word \<Rightarrow>('a::len)Word.word \<Rightarrow>(('a::len)Word.word)option "  where 
     " quot_vec_maybe  l r = ( quot_bv 
  instance_Sail_values_Bitvector_Machine_word_mword_dict instance_Sail_values_Bitvector_Machine_word_mword_dict l r )"

definition quot_vec_fail  :: "('a::len)Word.word \<Rightarrow>('a::len)Word.word \<Rightarrow>('rv,(('a::len)Word.word),'e)monad "  where 
     " quot_vec_fail   l r = ( maybe_fail (''quot_vec'') (quot_bv 
  instance_Sail_values_Bitvector_Machine_word_mword_dict instance_Sail_values_Bitvector_Machine_word_mword_dict l r))"

definition quot_vec_oracle  :: "('a::len)Word.word \<Rightarrow>('a::len)Word.word \<Rightarrow>('rv,(('a::len)Word.word),'e)monad "  where 
     " quot_vec_oracle l r = (
  (case  (quot_bv instance_Sail_values_Bitvector_Machine_word_mword_dict instance_Sail_values_Bitvector_Machine_word_mword_dict l r) of
      Some w => return w
    | None => mword_oracle () 
  ))"


(*val quots_vec        : forall 'a. Size 'a => mword 'a -> mword 'a -> mword 'a*)
(*val quots_vec_maybe  : forall 'a. Size 'a => mword 'a -> mword 'a -> maybe (mword 'a)*)
(*val quots_vec_fail   : forall 'rv 'a 'e. Size 'a => mword 'a -> mword 'a -> monad 'rv (mword 'a) 'e*)
(*val quots_vec_oracle : forall 'rv 'a 'e. Size 'a => mword 'a -> mword 'a -> monad 'rv (mword 'a) 'e*)
definition quots_vec  :: "('a::len)Word.word \<Rightarrow>('a::len)Word.word \<Rightarrow>('a::len)Word.word "  where 
     " quots_vec        l r = ( quots_mword l r )"

definition quots_vec_maybe  :: "('a::len)Word.word \<Rightarrow>('a::len)Word.word \<Rightarrow>(('a::len)Word.word)option "  where 
     " quots_vec_maybe  l r = ( quots_bv 
  instance_Sail_values_Bitvector_Machine_word_mword_dict instance_Sail_values_Bitvector_Machine_word_mword_dict l r )"

definition quots_vec_fail  :: "('a::len)Word.word \<Rightarrow>('a::len)Word.word \<Rightarrow>('rv,(('a::len)Word.word),'e)monad "  where 
     " quots_vec_fail   l r = ( maybe_fail (''quots_vec'') (quots_bv 
  instance_Sail_values_Bitvector_Machine_word_mword_dict instance_Sail_values_Bitvector_Machine_word_mword_dict l r))"

definition quots_vec_oracle  :: "('a::len)Word.word \<Rightarrow>('a::len)Word.word \<Rightarrow>('rv,(('a::len)Word.word),'e)monad "  where 
     " quots_vec_oracle l r = (
  (case  (quots_bv instance_Sail_values_Bitvector_Machine_word_mword_dict instance_Sail_values_Bitvector_Machine_word_mword_dict l r) of
      Some w => return w
    | None => mword_oracle () 
  ))"


(*val mod_vec_int        : forall 'a. Size 'a => mword 'a -> integer -> mword 'a*)
(*val mod_vec_int_maybe  : forall 'a. Size 'a => mword 'a -> integer -> maybe (mword 'a)*)
(*val mod_vec_int_fail   : forall 'rv 'a 'e. Size 'a => mword 'a -> integer -> monad 'rv (mword 'a) 'e*)
(*val mod_vec_int_oracle : forall 'rv 'a 'e. Size 'a => mword 'a -> integer -> monad 'rv (mword 'a) 'e*)
definition mod_vec_int  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow>('a::len)Word.word "  where 
     " mod_vec_int        l r = ( mod_mword_int l r )"

definition mod_vec_int_maybe  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow>(('a::len)Word.word)option "  where 
     " mod_vec_int_maybe  l r = ( mod_bv_int 
  instance_Sail_values_Bitvector_Machine_word_mword_dict instance_Sail_values_Bitvector_Machine_word_mword_dict l r )"

definition mod_vec_int_fail  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow>('rv,(('a::len)Word.word),'e)monad "  where 
     " mod_vec_int_fail   l r = ( maybe_fail (''mod_vec_int'') (mod_bv_int 
  instance_Sail_values_Bitvector_Machine_word_mword_dict instance_Sail_values_Bitvector_Machine_word_mword_dict l r))"

definition mod_vec_int_oracle  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow>('rv,(('a::len)Word.word),'e)monad "  where 
     " mod_vec_int_oracle l r = (
  (case  (mod_bv_int instance_Sail_values_Bitvector_Machine_word_mword_dict instance_Sail_values_Bitvector_Machine_word_mword_dict l r) of
      Some w => return w
    | None => mword_oracle () 
  ))"


(*val quot_vec_int        : forall 'a. Size 'a => mword 'a -> integer -> mword 'a*)
(*val quot_vec_int_maybe  : forall 'a. Size 'a => mword 'a -> integer -> maybe (mword 'a)*)
(*val quot_vec_int_fail   : forall 'rv 'a 'e. Size 'a => mword 'a -> integer -> monad 'rv (mword 'a) 'e*)
(*val quot_vec_int_oracle : forall 'rv 'a 'e. Size 'a => mword 'a -> integer -> monad 'rv (mword 'a) 'e*)
definition quot_vec_int  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow>('a::len)Word.word "  where 
     " quot_vec_int        l r = ( quot_mword_int l r )"

definition quot_vec_int_maybe  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow>(('a::len)Word.word)option "  where 
     " quot_vec_int_maybe  l r = ( quot_bv_int 
  instance_Sail_values_Bitvector_Machine_word_mword_dict instance_Sail_values_Bitvector_Machine_word_mword_dict l r )"

definition quot_vec_int_fail  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow>('rv,(('a::len)Word.word),'e)monad "  where 
     " quot_vec_int_fail   l r = ( maybe_fail (''quot_vec_int'') (quot_bv_int 
  instance_Sail_values_Bitvector_Machine_word_mword_dict instance_Sail_values_Bitvector_Machine_word_mword_dict l r))"

definition quot_vec_int_oracle  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow>('rv,(('a::len)Word.word),'e)monad "  where 
     " quot_vec_int_oracle l r = (
  (case  (quot_bv_int 
  instance_Sail_values_Bitvector_Machine_word_mword_dict instance_Sail_values_Bitvector_Machine_word_mword_dict l r) of
      Some w => return w
    | None => mword_oracle () 
  ))"


(*val replicate_bits : forall 'a 'b. Size 'a, Size 'b => mword 'a -> integer -> mword 'b*)
definition replicate_bits  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow>('b::len)Word.word "  where 
     " replicate_bits v count1 = ( Word.of_bl (repeat (Word.to_bl v) count1))"


(*val duplicate_bool : forall 'a. Size 'a => bool -> integer -> mword 'a*)
definition duplicate_bool  :: " bool \<Rightarrow> int \<Rightarrow>('a::len)Word.word "  where 
     " duplicate_bool   b n = ( Word.of_bl (repeat [b] n))"

definition duplicate_maybe  :: " bitU \<Rightarrow> int \<Rightarrow>(('a::len)Word.word)option "  where 
     " duplicate_maybe  b n = ( map_option (\<lambda> b .  duplicate_bool b n) (bool_of_bitU b))"

definition duplicate_fail  :: " bitU \<Rightarrow> int \<Rightarrow>('c,(('a::len)Word.word),'b)monad "  where 
     " duplicate_fail   b n = ( bool_of_bitU_fail b \<bind> (\<lambda> b .  return (duplicate_bool b n)))"

definition duplicate_oracle  :: " bitU \<Rightarrow> int \<Rightarrow>('c,(('a::len)Word.word),'b)monad "  where 
     " duplicate_oracle b n = ( bool_of_bitU_oracle b \<bind> (\<lambda> b .  return (duplicate_bool b n)))"

definition duplicate  :: " bitU \<Rightarrow> int \<Rightarrow>('a::len)Word.word "  where 
     " duplicate        b n = ( maybe_failwith (duplicate_maybe b n))"


(*val reverse_endianness : forall 'a. Size 'a => mword 'a -> mword 'a*)
definition reverse_endianness  :: "('a::len)Word.word \<Rightarrow>('a::len)Word.word "  where 
     " reverse_endianness v = ( Word.of_bl (reverse_endianness_list (Word.to_bl v)))"


(*val get_slice_int : forall 'a. Size 'a => integer -> integer -> integer -> mword 'a*)
definition get_slice_int  :: " int \<Rightarrow> int \<Rightarrow> int \<Rightarrow>('a::len)Word.word "  where 
     " get_slice_int = ( 
  get_slice_int_bv instance_Sail_values_Bitvector_Machine_word_mword_dict )"


(*val set_slice_int : forall 'a. Size 'a => integer -> integer -> integer -> mword 'a -> integer*)
definition set_slice_int  :: " int \<Rightarrow> int \<Rightarrow> int \<Rightarrow>('a::len)Word.word \<Rightarrow> int "  where 
     " set_slice_int = ( 
  set_slice_int_bv instance_Sail_values_Bitvector_Machine_word_mword_dict )"


(*val slice : forall 'a 'b. Size 'a, Size 'b => mword 'a -> integer -> integer -> mword 'b*)
definition slice  :: "('a::len)Word.word \<Rightarrow> int \<Rightarrow> int \<Rightarrow>('b::len)Word.word "  where 
     " slice v lo len = (
  subrange_vec_dec v ((lo + len) -( 1 :: int)) lo )"


(*val set_slice : forall 'a 'b. Size 'a, Size 'b => integer -> integer -> mword 'a -> integer -> mword 'b -> mword 'a*)
definition set_slice  :: " int \<Rightarrow> int \<Rightarrow>('a::len)Word.word \<Rightarrow> int \<Rightarrow>('b::len)Word.word \<Rightarrow>('a::len)Word.word "  where 
     " set_slice (out_len::ii) (slice_len::ii) out (n::ii) v = (
  update_subrange_vec_dec out ((n + slice_len) -( 1 :: int)) n v )"


(*val eq_vec    : forall 'a. Size 'a => mword 'a -> mword 'a -> bool*)
(*val neq_vec   : forall 'a. Size 'a => mword 'a -> mword 'a -> bool*)
end

(define (domain hanoi)
  (:requirements :strips :typing :action-costs :negative-preconditions)
  (:types 
    disk - object
    peg - object
  )
  (:predicates
    (on ?d1 - disk ?d2 - disk) ; d1 immediately on d2
    (base-on ?d - disk ?p - peg) ; d is the base disk on peg p
    (clear ?d - disk) ; d is the top disk of a stack (nothing on it)
    (peg-empty ?p - peg) ; peg p has no disks
    
    (smaller ?d1 - disk ?d2 - disk) ; d1 < d2 (Static size relationship)
  )
  (:functions
    (total-cost)
  )

  ; A1. Move D (on D_S) to D_T (Disk target)
  (:action move-disk-to-disk
    :parameters (?d - disk ?d_s - disk ?d_t - disk)
    :precondition (and 
      (clear ?d)
      (on ?d ?d_s)
      (clear ?d_t)
      (smaller ?d ?d_t) ; Rule: Cannot place larger disk on smaller disk
    )
    :effect (and 
      (not (on ?d ?d_s))
      (on ?d ?d_t)
      (clear ?d_s)
      (not (clear ?d_t))
      (increase (total-cost) 1)
    )
  )

  ; A2. Move D (on D_S) to P_T (Peg target - makes D the base disk)
  (:action move-disk-to-peg-empty
    :parameters (?d - disk ?d_s - disk ?p_t - peg)
    :precondition (and 
      (clear ?d)
      (on ?d ?d_s)
      (peg-empty ?p_t)
    )
    :effect (and 
      (not (on ?d ?d_s))
      (clear ?d_s)
      (base-on ?d ?p_t)
      (not (peg-empty ?p_t))
      (increase (total-cost) 1)
    )
  )
  
  ; B1. Move D (base on P_F) to D_T (Disk target)
  (:action move-peg-to-disk
    :parameters (?d - disk ?p_f - peg ?d_t - disk)
    :precondition (and 
      (clear ?d)
      (base-on ?d ?p_f)
      (clear ?d_t)
      (smaller ?d ?d_t) ; Rule: Cannot place larger disk on smaller disk
    )
    :effect (and 
      (not (base-on ?d ?p_f))
      (peg-empty ?p_f)
      (on ?d ?d_t)
      (not (clear ?d_t))
      (increase (total-cost) 1)
    )
  )

  ; B2. Move D (base on P_F) to P_T (Peg target - makes D the base disk)
  (:action move-peg-to-peg-empty
    :parameters (?d - disk ?p_f - peg ?p_t - peg)
    :precondition (and 
      (clear ?d)
      (base-on ?d ?p_f)
      (peg-empty ?p_t)
      (not (= ?p_f ?p_t))
    )
    :effect (and 
      (not (base-on ?d ?p_f))
      (peg-empty ?p_f)
      (base-on ?d ?p_t)
      (not (peg-empty ?p_t))
      (increase (total-cost) 1)
    )
  )
)
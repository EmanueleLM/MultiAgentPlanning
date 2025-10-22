(define (domain tower-of-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)
  (:predicates
    ;; disk ?d is directly on object ?x (object = disk or peg)
    (on ?d - disk ?x - object)
    ;; object (disk or peg) has nothing directly on top
    (clear ?x - object)
    ;; static size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?s - object ?t - peg)
    :precondition (and
      (on ?d ?s)      ; ?d is directly on ?s (peg or disk)
      (clear ?d)      ; ?d is top on its source stack
      (clear ?t)      ; target peg has nothing on it (empty top)
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d ?t)
      (clear ?s)      ; the object that used to be below ?d becomes clear
      (not (clear ?t)) ; target peg no longer clear (now has ?d on top)
    )
  )

  ;; Move a top disk onto another disk (the target disk must be larger)
  (:action move-to-disk
    :parameters (?d - disk ?s - object ?t - disk)
    :precondition (and
      (on ?d ?s)       ; ?d is directly on ?s (peg or disk)
      (clear ?d)       ; ?d is top on its source stack
      (clear ?t)       ; the target disk ?t must be the top disk on its peg/stack
      (smaller ?d ?t)  ; only allow placing smaller disk ?d onto larger disk ?t
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d ?t)
      (clear ?s)       ; the object that used to be below ?d becomes clear
      (not (clear ?t)) ; target disk no longer clear (now has ?d on top)
    )
  )
)
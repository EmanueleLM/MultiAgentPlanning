(define (domain tower-of-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk - place)

  (:predicates
    ;; disk d is directly on place p (place = peg or disk)
    (on ?d - disk ?p - place)
    ;; place (peg or disk) has nothing on top of it
    (clear ?p - place)
    ;; size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a clear disk from any place onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?src - place ?dst - peg)
    :precondition (and
      (on ?d ?src)
      (clear ?d)
      (clear ?dst)
      (not (= ?src ?dst))
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?dst)
      (clear ?src)
      (not (clear ?dst))
    )
  )

  ;; Move a clear disk from any place onto an empty disk (must be smaller)
  (:action move-to-disk
    :parameters (?d - disk ?src - place ?dst - disk)
    :precondition (and
      (on ?d ?src)
      (clear ?d)
      (clear ?dst)
      (smaller ?d ?dst)
      (not (= ?src ?dst))
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?dst)
      (clear ?src)
      (not (clear ?dst))
    )
  )
)
(define (domain tower-of-hanoi-7)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj disk peg stage)
  (:predicates
    ;; on ?d ?x : disk ?d is immediately on object ?x (disk or peg)
    (on ?d - disk ?x - obj)
    ;; clear ?d : disk ?d has no disk on top of it
    (clear ?d - disk)
    ;; empty ?p : peg ?p has no disk on it
    (empty ?p - peg)
    ;; size ordering: smaller x y means disk x is smaller than disk y
    (smaller ?x - disk ?y - disk)
    ;; discrete stages / time points
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk that sits directly on a peg to an empty peg.
  (:action move-peg-to-empty-peg
    :parameters (?d - disk ?src - peg ?dst - peg ?st - stage ?st2 - stage)
    :precondition (and
      (on ?d ?src)
      (clear ?d)
      (empty ?dst)
      (current ?st)
      (next ?st ?st2)
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?dst)
      (not (empty ?dst))
      (empty ?src)
      (not (current ?st))
      (current ?st2)
    )
  )

  ;; Move a top disk that sits directly on a peg onto the top of another peg (onto its top disk).
  (:action move-peg-to-disk
    :parameters (?d - disk ?src - peg ?t - disk ?dstpeg - peg ?st - stage ?st2 - stage)
    :precondition (and
      (on ?d ?src)
      (clear ?d)
      (on ?t ?dstpeg)
      (clear ?t)
      (smaller ?d ?t)
      (current ?st)
      (next ?st ?st2)
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?t)
      (not (clear ?t))
      (empty ?src)
      (not (current ?st))
      (current ?st2)
    )
  )

  ;; Move a top disk that sits on another disk to an empty peg.
  (:action move-disk-to-empty-peg
    :parameters (?d - disk ?below - disk ?dst - peg ?st - stage ?st2 - stage)
    :precondition (and
      (on ?d ?below)
      (clear ?d)
      (empty ?dst)
      (current ?st)
      (next ?st ?st2)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?dst)
      (not (empty ?dst))
      (clear ?below)
      (not (current ?st))
      (current ?st2)
    )
  )

  ;; Move a top disk that sits on another disk onto the top of another disk.
  (:action move-disk-to-disk
    :parameters (?d - disk ?below - disk ?t - disk ?dstpeg - peg ?st - stage ?st2 - stage)
    :precondition (and
      (on ?d ?below)
      (clear ?d)
      (on ?t ?dstpeg)
      (clear ?t)
      (smaller ?d ?t)
      (current ?st)
      (next ?st ?st2)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?below)
      (not (current ?st))
      (current ?st2)
    )
  )
)
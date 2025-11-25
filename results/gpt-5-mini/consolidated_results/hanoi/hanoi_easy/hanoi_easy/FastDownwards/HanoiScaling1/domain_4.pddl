(define (domain hanoi3_staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)          ; disk directly on a peg
    (on-disk ?d - disk ?under - disk)   ; disk directly on another disk
    (top ?d - disk ?p - peg)            ; disk is topmost on peg p
    (empty ?p - peg)                    ; peg has no disks
    (smaller ?d1 - disk ?d2 - disk)     ; d1 is smaller than d2
    (current ?s - stage)                ; current stage
    (next ?s - stage ?s2 - stage)       ; successor stage relation
  )

  ;; Move a disk that is directly on a peg (and is the top disk there)
  ;; to an empty peg.
  (:action move-from-peg-to-empty
    :parameters (?d - disk ?src - peg ?dest - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?src)
      (top ?d ?src)
      (empty ?dest)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; support changes
      (not (on-peg ?d ?src))
      (on-peg ?d ?dest)

      ;; top/empty bookkeeping
      (not (top ?d ?src))
      (top ?d ?dest)
      (not (empty ?dest))
      (empty ?src)

      ;; stage progression
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a disk that is directly on a peg (and is the top disk there)
  ;; onto another disk (the destination peg is non-empty).
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?src - peg ?dest - peg ?topdest - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?src)
      (top ?d ?src)
      (top ?topdest ?dest)
      (smaller ?d ?topdest)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; support changes
      (not (on-peg ?d ?src))
      (on-disk ?d ?topdest)

      ;; top/empty bookkeeping
      (not (top ?d ?src))
      (top ?d ?dest)
      (not (top ?topdest ?dest))
      (not (empty ?dest))
      (empty ?src)

      ;; stage progression
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a disk that is on another disk (and is the top disk on its peg)
  ;; to an empty peg.
  (:action move-from-disk-to-empty
    :parameters (?d - disk ?under - disk ?src - peg ?dest - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?under)
      (top ?d ?src)
      (empty ?dest)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; support changes
      (not (on-disk ?d ?under))
      (on-peg ?d ?dest)

      ;; top/empty bookkeeping: the disk that was under becomes top on src
      (not (top ?d ?src))
      (top ?d ?dest)
      (top ?under ?src)

      (not (empty ?dest))

      ;; stage progression
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a disk that is on another disk (and is the top disk on its peg)
  ;; onto another disk (destination peg is non-empty).
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?under - disk ?src - peg ?dest - peg ?topdest - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?under)
      (top ?d ?src)
      (top ?topdest ?dest)
      (smaller ?d ?topdest)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; support changes
      (not (on-disk ?d ?under))
      (on-disk ?d ?topdest)

      ;; top/empty bookkeeping
      (not (top ?d ?src))
      (top ?d ?dest)
      (not (top ?topdest ?dest))
      (top ?under ?src)

      ;; stage progression
      (not (current ?s))
      (current ?s2)
    )
  )
)
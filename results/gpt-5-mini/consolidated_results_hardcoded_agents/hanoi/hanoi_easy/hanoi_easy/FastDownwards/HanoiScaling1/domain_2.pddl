(define (domain hanoi3_staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; placement predicates
    (on-peg ?d - disk ?p - peg)       ; disk is directly on a peg (bottom disk of that stack)
    (on-disk ?d - disk ?under - disk) ; disk is directly on another disk (immediately above)
    (top ?d - disk ?p - peg)          ; disk is currently the top disk on the named peg
    (empty ?p - peg)                  ; peg has no disks

    ;; static size ordering
    (smaller ?d1 - disk ?d2 - disk)

    ;; staging / sequencing (explicit discrete stages)
    (current ?s - stage)              ; which stage is active
    (next ?s - stage ?s2 - stage)     ; successor relation between stages (static)
  )

  ;; Move a disk that is directly on a peg (i.e. that peg's sole/bottom disk) onto an empty peg
  (:action move-peg-to-empty
    :parameters (?d - disk ?src - peg ?dest - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?src)
      (top ?d ?src)
      (empty ?dest)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; update placement
      (not (on-peg ?d ?src))
      (on-peg ?d ?dest)

      ;; top/empty bookkeeping on source peg and target peg
      (not (top ?d ?src))
      (top ?d ?dest)
      (not (empty ?dest))
      (empty ?src)

      ;; advance stage (strict sequential step)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a disk that is directly on a peg (bottom of that peg) onto another disk (top of target peg)
  (:action move-peg-to-disk
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
      ;; update placement: d is no longer on its source peg, now directly on topdest
      (not (on-peg ?d ?src))
      (on-disk ?d ?topdest)

      ;; top/empty bookkeeping
      (not (top ?d ?src))
      (top ?d ?dest)
      (not (top ?topdest ?dest))
      (not (empty ?dest))
      (empty ?src)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a disk that is directly on another disk (immediately above ?under) onto an empty peg
  (:action move-disk-to-empty
    :parameters (?d - disk ?under - disk ?src - peg ?dest - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?under)
      (top ?d ?src)
      (empty ?dest)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; update placement
      (not (on-disk ?d ?under))
      (on-peg ?d ?dest)

      ;; top bookkeeping: d moves from src to dest, its former under-disk becomes top of src
      (not (top ?d ?src))
      (top ?d ?dest)
      (top ?under ?src)

      ;; target peg now non-empty
      (not (empty ?dest))

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a disk that is directly on another disk (immediately above ?under) onto another disk (top of target peg)
  (:action move-disk-to-disk
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
      ;; update placement
      (not (on-disk ?d ?under))
      (on-disk ?d ?topdest)

      ;; top bookkeeping: d becomes top on target, topdest ceases to be top, under becomes top on source
      (not (top ?d ?src))
      (top ?d ?dest)
      (not (top ?topdest ?dest))
      (top ?under ?src)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )
)
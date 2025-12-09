(define (domain tower-of-hanoi-7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place stage)

  (:predicates
    ;; direct support: a disk is directly on a place (disk or peg)
    (support ?d - disk ?s - place)
    ;; disk belongs to the stack on a peg
    (on ?d - disk ?p - peg)
    ;; a disk has nothing on top of it
    (clear ?d - disk)
    ;; a peg has no disks
    (empty ?p - peg)
    ;; size relation (grounded in the problem)
    (smaller ?x - disk ?y - disk)
    ;; discrete stage progression
    (current ?t - stage)
    (next ?t1 - stage ?t2 - stage)
  )

  ;; Move a disk that is directly on another disk, placing it onto an empty destination peg.
  (:action move-disk-from-disk-to-empty
    :parameters (?d - disk ?below - disk ?src - peg ?dst - peg ?st - stage ?st2 - stage)
    :precondition (and
      (support ?d ?below)
      (on ?below ?src)
      (clear ?d)
      (empty ?dst)
      (current ?st)
      (next ?st ?st2)
    )
    :effect (and
      ;; remove old direct support relation and peg-membership of ?d
      (not (support ?d ?below))
      (not (on ?d ?src))

      ;; place d on destination peg
      (support ?d ?dst)
      (on ?d ?dst)
      (not (empty ?dst))

      ;; the disk that was below ?d becomes clear
      (clear ?below)

      ;; advance stage
      (not (current ?st))
      (current ?st2)
    )
  )

  ;; Move a disk that is directly on another disk, placing it onto an existing top disk ?t on destination peg.
  (:action move-disk-from-disk-to-disk
    :parameters (?d - disk ?below - disk ?t - disk ?src - peg ?dst - peg ?st - stage ?st2 - stage)
    :precondition (and
      (support ?d ?below)
      (on ?below ?src)
      (on ?t ?dst)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
      (current ?st)
      (next ?st ?st2)
    )
    :effect (and
      ;; remove old support and peg-membership for ?d
      (not (support ?d ?below))
      (not (on ?d ?src))

      ;; place d on top of t (support relation), and d belongs to dest peg
      (support ?d ?t)
      (on ?d ?dst)

      ;; t is no longer clear
      (not (clear ?t))

      ;; the disk below becomes clear
      (clear ?below)

      ;; advance stage
      (not (current ?st))
      (current ?st2)
    )
  )

  ;; Move a disk that is directly on a peg (no disk below it), placing it onto an empty destination peg.
  (:action move-disk-from-peg-to-empty
    :parameters (?d - disk ?src - peg ?dst - peg ?st - stage ?st2 - stage)
    :precondition (and
      (support ?d ?src)  ;; support is the peg itself in this case
      (on ?d ?src)
      (clear ?d)
      (empty ?dst)
      (current ?st)
      (next ?st ?st2)
    )
    :effect (and
      ;; remove d from its former peg
      (not (support ?d ?src))
      (not (on ?d ?src))

      ;; src peg becomes empty (d was directly on the peg and clear, so peg has no disks left)
      (empty ?src)

      ;; place d on destination peg
      (support ?d ?dst)
      (on ?d ?dst)
      (not (empty ?dst))

      ;; advance stage
      (not (current ?st))
      (current ?st2)
    )
  )

  ;; Move a disk that is directly on a peg (no disk below it), placing it onto an existing top disk ?t on destination peg.
  (:action move-disk-from-peg-to-disk
    :parameters (?d - disk ?t - disk ?src - peg ?dst - peg ?st - stage ?st2 - stage)
    :precondition (and
      (support ?d ?src)    ;; d's support is the peg ?src
      (on ?d ?src)
      (clear ?d)
      (on ?t ?dst)
      (clear ?t)
      (smaller ?d ?t)
      (current ?st)
      (next ?st ?st2)
    )
    :effect (and
      ;; remove d from its former peg
      (not (support ?d ?src))
      (not (on ?d ?src))

      ;; place d on t and mark membership to dest peg
      (support ?d ?t)
      (on ?d ?dst)

      ;; t is no longer clear
      (not (clear ?t))

      ;; because d was directly on peg src and was clear, src becomes empty
      (empty ?src)

      ;; advance stage
      (not (current ?st))
      (current ?st2)
    )
  )
)
(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk directly on a peg (no disk below)
    (on-disk ?d - disk ?below - disk)  ; disk directly on another disk
    (top ?d - disk ?p - peg)           ; disk d is the top disk on peg p
    (empty ?p - peg)                   ; peg has no disks
    (smaller ?d1 - disk ?d2 - disk)    ; d1 is smaller than d2
    (current ?s - stage)               ; the current stage/time step
    (succ ?s1 - stage ?s2 - stage)     ; s2 is the immediate successor of s1
  )

  ;; Move a disk that is directly on a peg to an empty peg
  (:action move-onpeg-to-empty
    :parameters (?d - disk ?p_from - peg ?p_to - peg ?s - stage ?ns - stage)
    :precondition (and
      (current ?s)
      (on-peg ?d ?p_from)
      (top ?d ?p_from)
      (empty ?p_to)
      (succ ?s ?ns)
    )
    :effect (and
      ;; remove from source
      (not (on-peg ?d ?p_from))
      (not (top ?d ?p_from))
      ;; source becomes empty
      (empty ?p_from)

      ;; place on target peg as top and on-peg
      (on-peg ?d ?p_to)
      (top ?d ?p_to)
      (not (empty ?p_to))

      ;; advance stage
      (not (current ?s))
      (current ?ns)
    )
  )

  ;; Move a disk that is directly on another disk to an empty peg
  (:action move-ondisk-to-empty
    :parameters (?d - disk ?below - disk ?p_from - peg ?p_to - peg ?s - stage ?ns - stage)
    :precondition (and
      (current ?s)
      (on-disk ?d ?below)
      (top ?d ?p_from)
      (empty ?p_to)
      (succ ?s ?ns)
    )
    :effect (and
      ;; remove the moved disk relation to its below disk and its top status
      (not (on-disk ?d ?below))
      (not (top ?d ?p_from))

      ;; the disk below becomes top on the same peg
      (top ?below ?p_from)

      ;; place moved disk on target peg
      (on-peg ?d ?p_to)
      (top ?d ?p_to)
      (not (empty ?p_to))

      ;; advance stage
      (not (current ?s))
      (current ?ns)
    )
  )

  ;; Move a disk that is directly on a peg onto a disk on another peg (target peg non-empty)
  (:action move-onpeg-to-ondisk
    :parameters (?d - disk ?p_from - peg ?t - disk ?p_to - peg ?s - stage ?ns - stage)
    :precondition (and
      (current ?s)
      (on-peg ?d ?p_from)
      (top ?d ?p_from)
      (top ?t ?p_to)
      (smaller ?d ?t)
      (succ ?s ?ns)
    )
    :effect (and
      ;; remove from source
      (not (on-peg ?d ?p_from))
      (not (top ?d ?p_from))
      ;; source becomes empty
      (empty ?p_from)

      ;; place on target disk
      (on-disk ?d ?t)
      (top ?d ?p_to)
      ;; the previous top on target is no longer top
      (not (top ?t ?p_to))

      ;; advance stage
      (not (current ?s))
      (current ?ns)
    )
  )

  ;; Move a disk that is directly on another disk onto another disk
  (:action move-ondisk-to-ondisk
    :parameters (?d - disk ?below - disk ?p_from - peg ?t - disk ?p_to - peg ?s - stage ?ns - stage)
    :precondition (and
      (current ?s)
      (on-disk ?d ?below)
      (top ?d ?p_from)
      (top ?t ?p_to)
      (smaller ?d ?t)
      (succ ?s ?ns)
    )
    :effect (and
      ;; remove moved-disk's relation to below and its top at source
      (not (on-disk ?d ?below))
      (not (top ?d ?p_from))

      ;; below disk becomes top at source
      (top ?below ?p_from)

      ;; place moved disk on target disk
      (on-disk ?d ?t)
      (top ?d ?p_to)
      ;; previous top on target is no longer top
      (not (top ?t ?p_to))

      ;; advance stage
      (not (current ?s))
      (current ?ns)
    )
  )
)
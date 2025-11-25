(define (domain tower-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; a disk is directly on another disk
    (on-disk ?d - disk ?under - disk)
    ;; a disk is directly on a peg
    (on-peg ?d - disk ?p - peg)

    ;; no disk is on top of ?d (i.e., ?d is topmost of its stack)
    (top ?d - disk)

    ;; peg has no disks on it
    (empty ?p - peg)

    ;; size ordering: x is strictly smaller than y
    (smaller ?x - disk ?y - disk)

    ;; discrete stage progression
    (next ?s - stage ?s2 - stage)
    (current ?s - stage)
  )

  ;; move a top disk that is directly on another disk onto another top disk
  (:action move-disk-from-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
                    (on-disk ?d ?from)
                    (top ?d)            ;; ?d is topmost on its source
                    (top ?to)           ;; target disk is topmost
                    (smaller ?d ?to)    ;; size rule
                    (current ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              ;; relocate ?d from being on ?from to being on ?to
              (not (on-disk ?d ?from))
              (on-disk ?d ?to)

              ;; the disk that was supporting ?d becomes top
              (top ?from)

              ;; target disk is no longer top (it now has ?d above)
              (not (top ?to))

              ;; moved disk becomes top
              (top ?d)

              ;; advance stage
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; move a top disk that is directly on another disk onto an empty peg
  (:action move-disk-from-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
                    (on-disk ?d ?from)
                    (top ?d)            ;; ?d is topmost on its source
                    (empty ?to)         ;; target peg is empty
                    (current ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              ;; relocate ?d onto peg
              (not (on-disk ?d ?from))
              (on-peg ?d ?to)

              ;; the disk that was supporting ?d becomes top
              (top ?from)

              ;; target peg is no longer empty
              (not (empty ?to))

              ;; moved disk becomes top
              (top ?d)

              ;; advance stage
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; move a top disk that is directly on a peg onto a top disk
  (:action move-disk-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
                    (on-peg ?d ?from)
                    (top ?d)            ;; ?d is topmost on its peg (hence the only disk on that peg)
                    (top ?to)           ;; target disk is topmost
                    (smaller ?d ?to)    ;; size rule
                    (current ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              ;; relocate ?d onto disk ?to
              (not (on-peg ?d ?from))
              (on-disk ?d ?to)

              ;; source peg becomes empty (was the only disk)
              (empty ?from)

              ;; target disk is no longer top (it now has ?d above)
              (not (top ?to))

              ;; moved disk becomes top
              (top ?d)

              ;; advance stage
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; move a top disk that is directly on a peg onto another empty peg
  (:action move-disk-from-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
                    (on-peg ?d ?from)
                    (top ?d)            ;; ?d is topmost on its peg (hence the only disk on that peg)
                    (empty ?to)         ;; target peg empty
                    (current ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              ;; relocate ?d between pegs
              (not (on-peg ?d ?from))
              (on-peg ?d ?to)

              ;; source peg becomes empty
              (empty ?from)

              ;; target peg no longer empty
              (not (empty ?to))

              ;; moved disk becomes top
              (top ?d)

              ;; advance stage
              (not (current ?s))
              (current ?s2)
            )
  )
)
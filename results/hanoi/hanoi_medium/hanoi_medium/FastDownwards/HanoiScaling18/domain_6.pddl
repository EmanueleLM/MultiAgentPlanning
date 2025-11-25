(define (domain tower-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; disk d is directly on disk under
    (on ?d - disk ?under - disk)
    ;; disk d is directly on peg p
    (on-peg ?d - disk ?p - peg)

    ;; topness and peg emptiness
    (top ?d - disk)      ;; no disk is on top of ?d
    (empty ?p - peg)     ;; peg ?p has no disks on it

    ;; size ordering: x is strictly smaller than y
    (smaller ?x - disk ?y - disk)

    ;; discrete stage progression
    (next ?s - stage ?s2 - stage)
    (current ?s - stage)
  )

  ;; move a disk that is on top of another disk onto another disk
  (:action move-disk-from-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
                    (on ?d ?from)
                    (top ?d)            ;; ?d is topmost on its source
                    (top ?to)           ;; ?to is topmost so we place on it
                    (smaller ?d ?to)    ;; size rule
                    (current ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              ;; relocate ?d
              (not (on ?d ?from))
              (on ?d ?to)

              ;; the previous supporter becomes top
              (top ?from)

              ;; the target loses topness (now has ?d above)
              (not (top ?to))

              ;; moved disk is topmost
              (top ?d)

              ;; advance stage
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; move a disk that is on top of another disk onto an empty peg
  (:action move-disk-from-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
                    (on ?d ?from)
                    (top ?d)            ;; ?d is topmost on its source
                    (empty ?to)         ;; target peg is empty
                    (current ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              ;; relocate ?d
              (not (on ?d ?from))
              (on-peg ?d ?to)

              ;; the previous supporter becomes top
              (top ?from)

              ;; target peg no longer empty
              (not (empty ?to))

              ;; moved disk is topmost
              (top ?d)

              ;; advance stage
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; move a disk that is on top of a peg onto a disk
  (:action move-disk-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
                    (on-peg ?d ?from)
                    (top ?d)            ;; topmost on its peg
                    (top ?to)           ;; target disk is topmost
                    (smaller ?d ?to)    ;; size rule
                    (current ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              ;; relocate ?d
              (not (on-peg ?d ?from))
              (on ?d ?to)

              ;; source peg becomes empty
              (empty ?from)

              ;; target loses topness
              (not (top ?to))

              ;; moved disk is topmost
              (top ?d)

              ;; advance stage
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; move a disk that is on top of a peg onto another empty peg
  (:action move-disk-from-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
                    (on-peg ?d ?from)
                    (top ?d)            ;; topmost on its peg
                    (empty ?to)         ;; target peg empty
                    (current ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              ;; relocate ?d
              (not (on-peg ?d ?from))
              (on-peg ?d ?to)

              ;; source peg becomes empty
              (empty ?from)

              ;; target peg no longer empty
              (not (empty ?to))

              ;; moved disk is topmost
              (top ?d)

              ;; advance stage
              (not (current ?s))
              (current ?s2)
            )
  )
)
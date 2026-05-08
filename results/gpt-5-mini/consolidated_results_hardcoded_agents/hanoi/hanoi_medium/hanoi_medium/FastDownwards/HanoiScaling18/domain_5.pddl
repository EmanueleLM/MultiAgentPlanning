(define (domain tower-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; disk-on-disk: (on d u) means disk d is directly on disk u
    (on ?d - disk ?under - disk)
    ;; disk-on-peg: (on-peg d p) means disk d is directly on peg p
    (on-peg ?d - disk ?p - peg)

    ;; topness predicates
    (clear-disk ?d - disk)   ;; no disk is on top of ?d
    (clear-peg ?p - peg)     ;; no disk is on peg ?p

    ;; size ordering: (smaller x y) means x is strictly smaller than y
    (smaller ?smaller - disk ?larger - disk)

    ;; discrete stage progression
    (next ?s - stage ?s2 - stage)
    (current ?s - stage)
  )

  ;; move a disk that is on another disk onto another disk
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
                    (on ?d ?from)
                    (clear-disk ?d)     ;; ?d is topmost on its source
                    (clear-disk ?to)    ;; ?to is topmost on its stack (so we place on it)
                    (smaller ?d ?to)    ;; size rule
                    (current ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)

              ;; source disk ?from becomes topmost (no disk on it anymore)
              (clear-disk ?from)

              ;; target disk ?to now has a disk on top, so it is not clear
              (not (clear-disk ?to))

              ;; moved disk ?d is now topmost
              (clear-disk ?d)

              ;; advance stage
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; move a disk that is on another disk onto an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
                    (on ?d ?from)
                    (clear-disk ?d)     ;; ?d is topmost on its source
                    (clear-peg ?to)     ;; target peg is empty on top
                    (current ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              (not (on ?d ?from))
              (on-peg ?d ?to)

              ;; source disk ?from becomes topmost
              (clear-disk ?from)

              ;; target peg now has a disk, so it is not clear
              (not (clear-peg ?to))

              ;; moved disk ?d is topmost
              (clear-disk ?d)

              ;; advance stage
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; move a disk that is on an empty peg onto another disk
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
                    (on-peg ?d ?from)
                    (clear-disk ?d)     ;; topmost on its peg
                    (clear-disk ?to)    ;; target disk is topmost
                    (smaller ?d ?to)    ;; size rule
                    (current ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              (not (on-peg ?d ?from))
              (on ?d ?to)

              ;; peg ?from becomes empty on top
              (clear-peg ?from)

              ;; target disk ?to now has a disk on top
              (not (clear-disk ?to))

              ;; moved disk ?d is topmost
              (clear-disk ?d)

              ;; advance stage
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; move a disk that is on an empty peg onto an empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
                    (on-peg ?d ?from)
                    (clear-disk ?d)     ;; topmost on its peg
                    (clear-peg ?to)     ;; target peg empty on top
                    (current ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              (not (on-peg ?d ?from))
              (on-peg ?d ?to)

              ;; source peg becomes empty on top
              (clear-peg ?from)

              ;; target peg now has disk ?d on it
              (not (clear-peg ?to))

              ;; moved disk ?d is topmost
              (clear-disk ?d)

              ;; advance stage
              (not (current ?s))
              (current ?s2)
            )
  )
)
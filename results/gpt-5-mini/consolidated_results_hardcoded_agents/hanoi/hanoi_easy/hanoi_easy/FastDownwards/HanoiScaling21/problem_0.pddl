(define (problem hanoi-4-peg-middle)
  (:domain hanoi-multiagent)
  (:objects
    a1 a2 - agent
    A B C D - disk
    left mid right - peg
  )

  (:init
    ;; Agents (informational; actions are agent-specific so these are optional)
    ;; Disk size ordering: A < B < C < D
    (smaller A B)
    (smaller A C)
    (smaller A D)
    (smaller B C)
    (smaller B D)
    (smaller C D)

    ;; Initial stack on left peg: top A, then B, then C, then D (bottom)
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-peg D left)

    ;; Top bookkeeping: left peg top is A; mid and right are empty
    (top left A)
    (empty mid)
    (empty right)

    ;; All disks currently located at peg left (root peg)
    (peg-at A left)
    (peg-at B left)
    (peg-at C left)
    (peg-at D left)
  )

  (:goal (and
    ;; Goal: middle peg holds A (top), B, C, D (bottom), left and right empty.
    (top mid A)
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-peg D mid)

    (peg-at A mid)
    (peg-at B mid)
    (peg-at C mid)
    (peg-at D mid)

    (empty left)
    (empty right)
  ))
)
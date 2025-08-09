(define (problem vault-collab-prob)
  (:domain vault-collab)

  (:objects
    big-robot   - robot
    small-robot - robot
    vault1      - vault
    key1        - key
    object1     - object)

  (:init
    (big          big-robot)
    (small        small-robot)
    (at-entrance  big-robot     vault1)
    (at-entrance  small-robot  vault1)
    (has-key      big-robot key1)
    (closed       vault1)
    (object-inside object1 vault1)
    (fits         small-robot vault1))

  (:goal
    (and
      (open vault1)
      (grabbed object1))) )
(define (problem vault-problem)
  (:domain vault-domain)
  (:objects
    A B - agent
    key1 - key
    obj1 - object
    outside vault1 - place)
  (:init
    (at A outside)
    (at B outside)
    (door-closed vault1)
    (has-key A key1)
    (can-enter B vault1)
    (cannot-grab A vault1)
    (in obj1 vault1))
  (:goal
    (and
      (door-open vault1)
      (has-object B obj1))) )
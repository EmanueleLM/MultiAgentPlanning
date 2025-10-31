(define (problem orchestrate-problem)
  (:domain orchestrated)
  (:objects
    alice bob - agent
    vase1 cup1 - obj
    loc1 loc2 - loc
    cat1 - cat
    liquid - tex
  )
  (:init
    (at-agent alice loc1)
    (at-agent bob loc2)
    (at-obj vase1 loc1)
    (at-obj cup1 loc2)
    (vase vase1)
    (texture cup1 liquid)
    (next loc1 loc2)
    (cats cat1)
    (spring)
    (available vase1)
    (can_collect alice)
  )
  (:goal
    (and
      (collect alice vase1)
      (stupendous vase1)
      (remembered alice vase1)
    )
  )
)
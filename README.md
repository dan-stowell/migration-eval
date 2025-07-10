# migration-eval

## how i run an experiment right now

```
export REPO=ninja
export EXP=`date "+%Y-%m-%d-%H-%M-%S-$REPO"`
cd repos/$REPO
git checkout -b $EXP
script -q  ../../experiments/$EXP.log

# run the command you want to run
# remember to ctrl-d out of the script recording
clean-log.sh experiments/$EXP.log
# for the repo git commit ; git push
mv ~/.bz/output.json experiments/$EXP.bz.output.json
# git commit experiments
```

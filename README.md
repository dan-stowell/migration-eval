# migration-eval

## how i run an experiment right now

```
export EXP=`date "+%Y-%m-%d-%H-%M-%S"`
cd repos/$REPO
git checkout -b $EXP
script -q  ../../experiments/$EXP.log

# run the command you want to run
# remember to ctrl-d out of the script recording
# git commit ; git push $REPO
mv ~/.bz/output.json experiments/$EXP.bz.output.json
# git commit experiments
```

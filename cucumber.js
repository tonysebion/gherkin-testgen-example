module.exports = {
  default: [
    '--require-module', 'ts-node/register',
    '--require', 'step_definitions/**/*.ts',
    '--require', 'features/support/**/*.ts',
    'features/**/*.feature'
  ].join(' ')
};
